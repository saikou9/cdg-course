class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    #user dashboard feed
    @posts = Post.active

    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id

    @follower_suggestions = Account.where.not(id: following_ids)
  end

  def profile
    #user profile
  end
  
  def follow_account
    account_id = params[:follow_id]
    if Follower.create(follower_id: current_account.id, following_id: account_id)
      flash[:success] = "New following user"
    else
      flash[:danger] = "Unable to add following user"
    end
    
    redirect_to dashboard_path
  end

  def edit
    @account = Account.find(params[:id])
  end

  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end


end
