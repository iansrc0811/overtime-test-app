class Post < ActiveRecord::Base
  enum status: { submitted: 0, approved: 1, rejected: 2}
  belongs_to :user
  validates_presence_of :date, :rationale

  scope :posts_by, ->(user) { where(user_id: user.id)} #database scope pass a argument( current user) and 
  #由Active Record提供的方法 http://guides.rubyonrails.org/active_record_querying.html#retrieving-objects-from-the-database  
end
