class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]
  # before_action :set_account, only: [:total_followers]

  def index
    #user dashboard feed
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id

    @posts = Post.includes(:account).where(account_id: following_ids).active
    @comment = Comment.new

    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id

    @follower_suggestions = Account.where.not(id: following_ids)
  end

  def profile
    #user profile
  end

  def total_followers
    set_account
  end

  def total_following
    Follower.where(follower_id: current_account)
  end
  
  def follow_account
    account_id = params[:follow_id]
    if Follower.create(follower_id: current_account.id, following_id: account_id)
      flash[:success] = "New following user"
    else
      flash[:danger] = "Unable to add following user"
    end
  end

  def unfollow_account
    account_id = params[:follow_id]
    if Follower.find_by(follower_id: current_account.id, following_id: account_id).destroy
      flash[:success] = "Unfollow user"
    else
      flash[:danger] = "Unable to unfollowing user"
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end


end
