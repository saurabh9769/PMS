class MilestoneTaskId < ActiveRecord::Base

	belongs_to :milestone
	belongs_to :task

end
