class HomeController < ApplicationController
  def index
    @m4a = ITunesSearchAPI.search(:term => "#{params[:query]}", :country => "US", :media => "music")[0]["previewUrl"]
  end
end
