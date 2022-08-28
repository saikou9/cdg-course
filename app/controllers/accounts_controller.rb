class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    #user dashboard feed
    
    @posts = Post.active
  end

  def profile
    #user profile
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end

  def edit
    @account = Account.find(params[:id])
  end


end