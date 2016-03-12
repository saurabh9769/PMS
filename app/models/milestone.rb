class Milestone < ActiveRecord::Base

	has_many :milestone_project_ids
	has_many :projects , through: :milestone_project_ids

	has_many :milestone_task_ids
	has_many :tasks , through: :milestone_task_ids

end
