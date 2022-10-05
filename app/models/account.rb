class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :followed_account,
  #          foreign_key: :follower_id,
  #          class_name: 'Follower',
  #          dependent: :destroy

  # has_many :following, through: :followed_account, dependent: :destroy

  # has_many :followees_accounts, 
  #           foreign_key: :following_id,
  #           class_name: 'Follower',
  #           dependent: :destroy

  # has_many :followees, through: :following_id, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  def total_followers
    Follower.where(follower_id: self.id).count
  end

  def total_following
    Follower.where(following_id: self.id).count
  end
  
end
