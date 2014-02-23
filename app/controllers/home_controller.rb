class HomeController < ApplicationController

  def index
  end

  def show
    if params[:query] != ''
      @song = GetSong.new(params[:query])
    else
      @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    end
    @similar = @song.get_similar(19)
  end

  def about
  end

  def random
    @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    @similar = @song.get_similar(19)
    render 'show'
  end
end
