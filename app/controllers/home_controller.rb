class HomeController < ApplicationController
  def index
    cookies[:limit] ||= 60
  end

  def show
    cookies[:limit] ||= 60
    if params[:query] != ''
      @song = GetSong.new(params[:query])
    else
      @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    end
    @similar = @song.get_similar(cookies[:limit].to_i-1)
  end

  def about
  end

  def random
    cookies[:limit] ||= 60
    @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    @similar = @song.get_similar(cookies[:limit].to_i-1)
    render 'show'
  end

  def settings
    cookies[:limit] ||= 60
    if params[:limit]
      cookies[:limit] = params[:limit].to_i
    end
  end
end
