class HomeController < ApplicationController
  def index
  end

  def show
    if params[:query] != ''
      @song = GetSong.new(params[:query])
    else
      @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    end
    @similar = @song.get_similar(@limit - 1)
  end

  def about
  end

  def random
    @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    @similar = @song.get_similar(@limit - 1)
    render 'show'
  end

  def settings
    if params[:limit]
      session[:user] = { :limit => params[:limit] }
    end
  end
end
