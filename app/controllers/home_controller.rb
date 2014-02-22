class HomeController < ApplicationController
  def index

  end

  def show
    @song = GetSong.new(params[:query])
  end

end
