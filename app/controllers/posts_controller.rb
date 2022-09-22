class PostsController < ApplicationController
  before_action :authenticate_account!
  # before_action :show_post, only: [:show]

  def index
    @post = current_account.posts.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_account.posts.build(post_params)
    @post.account_id = current_account.id if account_signed_in?

    if @post.save
      redirect_to post_path(@post), flash: { success: "Post was created successfully :)"}
    else
      redirect_to new_post_path, flash: { danger: "Post was not save"}
    end
  end 

  def show
    @post = Post.find(params[:id]) if params[:id].present?
    @comment = Comment.new
  end

  # def show_post
  #   @post = Post.find(params[:id]) if params[:id].present?
  # end

  def edit
    @post = current_account.posts.find(params[:id])
  end

  def update
    @post = current_account.posts.find(params[:id])
    @post.update!(post_params)
    redirect_to @post
  end

  def destroy
    @post = current_account.posts.where(params[:id])
    @post.destroy(params[:id])

    redirect_to profile_path(current_account.username)
    flash[:success] = "The post was successfully destroyed."
  end

  private

  def post_params
    params.require(:post).permit(:image, :description)
  end

end