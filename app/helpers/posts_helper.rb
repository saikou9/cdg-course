module PostsHelper
  def current_like post
    like = current_account.likes.find_by(post: post)
  end
end
