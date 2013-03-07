class Project < ActiveRecord::Base
  attr_accessible :content, :tags, :title, :city, :description
  
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end

  default_scope order: 'projects.created_at DESC'
end
