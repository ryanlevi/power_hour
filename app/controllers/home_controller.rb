class HomeController < ApplicationController
  def index

  end

  def show
    @song = GetSong.new(params[:query])
    @similar = @song.get_similar(19)
  end

  def about
  end

  def random
    artists = ["kanye west", "alicia keys", "beyonce", "sublime", "kendrick lamar"]
    @song = GetSong.new(artists[rand(artists.length-1)])
    @similar = @song.get_similar(19)
    render 'show'
  end
end
