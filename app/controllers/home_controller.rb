class HomeController < ApplicationController

  def index
  end

  def show
    session[:user] = { :limit => 60 } unless session[:user][:limit]
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
    session[:user] = { :limit => 60 } unless session[:user][:limit]
    @song = GetSong.new(Queries.offset(rand(Queries.count)).first.query)
    @similar = @song.get_similar(session[:user][:limit].to_i - 1)
    render 'show'
  end

  def settings
    session[:user] = { :limit => 60 } unless session[:user][:limit]
    if params[:limit]
      session[:user] = { :limit => params[:limit] }
    end
  end
end
