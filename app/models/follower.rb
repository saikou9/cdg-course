class Follower < ApplicationRecord
  # belongs_to :follower_id, class_name: 'Account'
  # belongs_to :following_id, class_name: 'Account'
  validates_uniqueness_of :follower_id, scope: :following_id
end