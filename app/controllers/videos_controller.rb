class VideosController < ApplicationController
  # http_basic_authenticate_with name: "user", password: "user", except: [:index, :show]
  before_action :set_user_video, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:update]
  # before_action :set_video, only: [:edit, :update]
  #
  # def index
  #   @users = User.find(params[:id])
  #   @videos = @user.video
  # end
  #
  # def new
  #   @video = Video.new
  # end



  # minimise transactoin
  # roolback
  def create
    @user = User.find(params[:user_id])
    @video = @user.videos.create(video_params)
    redirect_to user_path(@user), notice: 'Video was successfully Added.'
  end

  def edit
    @user = User.find(params[:user_id])
    @video = @user.videos.find(params[:id])
  end

  def show
    @users = User.all
  end

  def update
    @user = User.find(params[:user_id])
    @video =  @user.videos.find(params[:id])

    if @video.update(video_params)
      # redirect_to @user
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @video = @user.videos.find(params[:id])
    @video.destroy

    redirect_to user_path(@user), status: :see_other
  end

  private
    def set_user_video
    @user = User.find(params[:user_id])
      @video = @user.videos.find(params[:id])
    end

  private
    def video_params
      params.require(:video).permit(:title, :description, :thumbnail)
    end
end
