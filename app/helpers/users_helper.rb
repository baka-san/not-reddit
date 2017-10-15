module UsersHelper

  def no_posts?
    @user.posts.empty? 
  end
end
