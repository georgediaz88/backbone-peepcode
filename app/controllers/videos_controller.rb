class VideosController < ApplicationController
  respond_to :json

  def index
    @videos = Video.all
    respond_with @videos
  end

  def show
    @video = Video.find(params[:id])
    respond_with @video
  end

  def update
    @video = Video.find(params[:id])
    @video.update_attributes(params[:video])
    respond_with @video
  end

  def create
    @video = Video.create(params[:video])
    respond_with @video
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    render nothing: true
  end

  def update_watched
    @video = Video.find(params[:id])
    if [true, false, "true", "false"].include? params[:watched]
      @video.update_attribute(:watched, params[:watched])
      respond_with @video
    else
      render nothing: true, status: 304
    end
  end

end