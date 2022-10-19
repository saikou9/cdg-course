class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account

  # after_create :update_post_like_counter

  private

  def update_post_like_counter
    Post.find(self.post_id).increment(:total_likes_count).save
  end

end