class Participation < ActiveRecord::Base
  attr_accessible :project_id

  belongs_to :participant, class_name: "User"
  belongs_to :project, class_name: "Project"

  validates :participant_id, presence: true
  validates :project_id, presence: true
end
