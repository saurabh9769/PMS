class MilestoneProjectId < ActiveRecord::Base

	belongs_to :milestone
	belongs_to :project

end
