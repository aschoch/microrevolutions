class Project < ActiveRecord::Base
  attr_accessible :content, :tags, :title
  
  belongs_to :user
  
  #validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  default_scope order: 'projects.created_at DESC'
end
