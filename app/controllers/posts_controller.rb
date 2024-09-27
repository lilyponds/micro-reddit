class PostsController < ApplicationController
def index
  @user = User.find(params[:id])
  @posts = Post.find(params[:user_id])
end
def show
  @post = Post.find(params[:id])
end

def create
  @user = User.find(params[:id])
  @post = @user.posts.create(title: "...", body: "...", user_id: :id)
  if @post.save
    redirect_to @post
  else
    render :new, status: :unprocessable_entity
  end
end
end
