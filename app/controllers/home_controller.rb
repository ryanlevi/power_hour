class HomeController < ApplicationController

  def index
    unless session[:user][:limit]
      session[:user] = { :limit => 60 }
    end
  end

  def show
    if params[:query] != ''
      @song = GetSong.new(params[:query])
    else
      @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    end
    @similar = @song.get_similar(session[:user][:limit].to_i - 1)
  end

  def about
  end

  def random
    @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    @similar = @song.get_similar(session[:user][:limit].to_i - 1)
    render 'show'
  end

  def settings
    unless session[:user][:limit]
      session[:user] = { :limit => 60 }
    end
    if params[:limit]
      session[:user] = { :limit => params[:limit] }
    end
  end
end
