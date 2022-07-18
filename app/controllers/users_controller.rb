class UsersController < ApplicationController
  def index
    @users = User.all.includes(:name, :photo, :posts_counter )
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.most_recent_three_posts
  end
end
