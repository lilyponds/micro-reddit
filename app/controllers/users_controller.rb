class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @feed = Post.all
    # @authored = Post.find([ :user_id ], [ :id ])
    # @commented = Comment.find(params[:user_id], [ :id ])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
