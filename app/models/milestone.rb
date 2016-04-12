class Milestone < ActiveRecord::Base

	has_many :milestone_project_ids
	has_many :projects , through: :milestone_project_ids

	has_many :milestone_task_ids
	has_many :tasks , through: :milestone_task_ids

	def self.search(search)
	  where("Name ILIKE ?", "%#{search}%") 
	  # where("Description ILIKE ?", "%#{search}%")
	end
	
	paginates_per 4
	max_paginates_per 100
	
end
