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
    random = Queries.offset(rand(Queries.count)).first.query
    @song = GetSong.new(random)
    while @song.title == random
      random = Queries.offset(rand(Queries.count)).first.query
      @song = GetSong.new(random)
    end
    @similar = @song.get_similar(cookies[:limit].to_i-1)
    render 'show'
  end

  def settings
    cookies[:limit] ||= 60
    if params[:limit]
      if params[:limit].to_i >= 120
        cookies[:limit] = 120
      elsif params[:limit].to_i < 1
        cookies[:limit] = 1
      else
        cookies[:limit] = params[:limit].to_i
      end
    end
  end
end
