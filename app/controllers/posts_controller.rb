class PostsController < ApplicationController
  def index
    @posts = Post.includes([:user]).order(user_id: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.most_recent_five_comments
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.find(params[:user_id])
    if @post.save
      redirect_to user_post_path(params[:user_id], @post.id)
    else
      render :index
    end
  end

  def create_comment
    @post = Post.find(params[:id])
    Comment.create(user: User.find(params[:user_id]), post: @post, text: comment_params[:text])
    redirect_to user_post_path(params[user_id], @post.id)
  rescue ActiveRecord::RecordInvalid
    render :show
  end

  def create_like
    @post = Post.find(params[:id])
    Like.create(user: User.find([user_id]), post: @post)
    redirect_to user_post_path(params[:user_id], @post.id)
  rescue ActiveRecord::RecordInvalid
    render :show
  end

  private

  def post_params
    params.permit(:title, :text)
  end

  def comment_params
    params.permit(:text)
  end

  def like_params
    params.permit(:post_id)
  end
end
