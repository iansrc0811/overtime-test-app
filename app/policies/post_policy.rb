class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || admin_types.include?(user.type) 
    #see def admin_types  in application_policy.rb
  end
end 