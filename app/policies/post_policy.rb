class PostPolicy < ApplicationPolicy
  def update?
    #此處的record 就是post， post.approved 中的approved是post status(enum)其中之一
    return true if admin? && post_approved? 
    #若post已approved，只有admin user 可以修改
    return true if user_or_admin && !post_approved?
     #當為本人或是admim的時候, 且還沒approved, 才可以update
    #see def admin_types  in application_policy.rb
  end

  private
    def user_or_admin
      record.user_id == user.id || admin?
    end

    def admin?
      admin_types.include?(user.type)
    end

    def post_approved?
      record.approved?
    end
end 