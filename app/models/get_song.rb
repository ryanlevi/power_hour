require 'lastfm'

class GetSong

  attr_accessor :query, :artist, :title, :price, :url, :jpg, :m4a, :all_songs, :search_results

  def initialize(query)
    @query = query
    if @query != ""
      @search_results = ITunesSearchAPI.search(:term => "#{@query}", :country => "US", :media => "music")
    end
    if @search_results
      @first_result = @search_results[0]
    end
    if @first_result
      @title = @first_result["trackName"]
      @artist = @first_result["artistName"]
      @price = @first_result["trackPrice"]
      @url =  @first_result["trackViewUrl"]
      @jpg = @first_result["artworkUrl100"]
      @m4a = @first_result["previewUrl"]
    end
  end

  def get_similar(limit)
    api_key = GetApiKeys.new.api_key
    api_secret = GetApiKeys.new.api_secret
    lastfm = Lastfm.new(api_key, api_secret)
    token = lastfm.auth.get_token
    @all_songs = []
    new_limit = limit * 2
    lastfm.track.get_similar(artist: @artist, track: @title, limit: new_limit.to_s).each do |track|
      song = GetSong.new "#{track["artist"]["name"]} #{track["name"]}"
      if song.search_results.length != 0
        @all_songs.push song
      end
    end
    @all_songs[0...limit]
  end

end