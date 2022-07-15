class PostsController < ApplicationController
  def index
    @posts = Post.all.order(user_id: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.most_recent_five_comments
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to user_post_path(current_user.id, @post,id)
    else render :index
    end
  end

  def create_comment
    @post = Post.find(params[:id])
    Comment.create(user: current_user, post: @post, text: commet_params[:text])
    redirect_to user_post_path(current_user.id, @post.id)
  rescue ActiveRecord::RecordInvalid
    render :show
  end

  def create_like
    @post = Post.find(params[:id])
    Like.create(user: current_user, post: @post)
    redirect_to user_post_path(current_user.id, @post.id)
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
