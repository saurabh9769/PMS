class ChangeDateTimeFormatToDateInProject < ActiveRecord::Migration
  def change
  	change_column :projects , :end_date , :date
  end
end
