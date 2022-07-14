class PostsController < ApplicationController
  def index
    @posts = Post.all.order(user_id: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.most_recent_five_comments
  end
end
