require 'lastfm'

class GetSong

  api_key = GetApiKeys.api_key
  api_secret = GetApiKeys.api_secret
  lastfm = Lastfm.new(api_key, api_secret)
  token = lastfm.auth.get_token

  attr_accessor :query, :artist, :title, :price, :url, :jpg, :m4a

  def initialize(query)
    @query = query
    @search_results = ITunesSearchAPI.search(:term => "#{@query}", :country => "US", :media => "music")
    @first_result = @search_results[0]
    @title = @first_result["trackName"]
    @artist = @first_result["artistName"]
    @price = @first_result["trackPrice"]
    @url =  @first_result["trackViewUrl"]
    @jpg = @first_result["artworkUrl100"]
    @m4a = @first_result["previewUrl"]
  end

  def get_similar(artist, title, limit)
    @similar_tracks = lastfm.track.get_similar(artist: @artist, track: @title, limit: @limit)
  end

end