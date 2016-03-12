class Project < ActiveRecord::Base

	has_many :user_project_ids
	has_many :users , through: :user_project_ids

	has_many :milestone_project_ids
  	has_many :milestones , through: :milestone_project_ids
	
end
