class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5it )
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.most_recent_three_posts.includes(:user)
  end
end
