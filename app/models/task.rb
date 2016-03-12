class Task < ActiveRecord::Base

	has_many :milestone_task_ids
	has_many :milestones , through: :milestone_task_ids
	
end
