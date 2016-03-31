class Task < ActiveRecord::Base

	has_many :milestone_task_ids
	has_many :milestones , through: :milestone_task_ids

	def self.search(search)
	  where("Name ILIKE ?", "%#{search}%") 
	  # where("Description ILIKE ?", "%#{search}%")
	end
	
end
