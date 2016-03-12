class ChangeDateTimeFormatToDateInProjects < ActiveRecord::Migration
  def change
  	change_column :projects , :start_date , :date
  end
end
