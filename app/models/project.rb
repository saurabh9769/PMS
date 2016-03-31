class Project < ActiveRecord::Base

	has_many :user_project_ids
	has_many :users , through: :user_project_ids

	has_many :milestone_project_ids
  	has_many :milestones , through: :milestone_project_ids
	
	
	def self.search(search)
	  where("Name ILIKE ?", "%#{search}%") 
	  # where("Description ILIKE ?", "%#{search}%")
	end

end
