module AccountsHelper

  def can_edit_profile? profile_id
    account_signed_in? && current_account.id == profile_id
  end

  def profile_picture account, width
    image_path = account.avatar.present? ? account.avatar : "default.png"
    image_tag(image_path, width: width, class: "img-circle")
  end
  
  def already_follow? profile_id
    Follower.where(follower_id: current_account.id, following_id: profile_id).exists?
  end

end
