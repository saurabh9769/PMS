class ChangeDateTimeFormatToDateInMilestone < ActiveRecord::Migration
  def change
  	change_column :milestones , :start_date , :date
  	change_column :milestones , :end_date , :date
  end
end
