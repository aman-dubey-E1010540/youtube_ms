class UsersController < ApplicationController
  http_basic_authenticate_with name: "user", password: "user", except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all

  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def set_user
      @user=User.find(params[:id])
    end

  private
    def user_params
      params.require(:user).permit(:name, :email, :dob)
    end
end
