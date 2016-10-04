class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new
    @video.user_id = params[:user_id]

    if @video.save
      redirect_to "/videos", :notice => "Video created successfully."
    else
      render 'new'
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    @video.user_id = params[:user_id]

    if @video.save
      redirect_to "/videos", :notice => "Video updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @video = Video.find(params[:id])

    @video.destroy

    redirect_to "/videos", :notice => "Video deleted."
  end
end
