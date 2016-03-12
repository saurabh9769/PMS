class RemoveColumnsFromTable < ActiveRecord::Migration
  def change
  	remove_column :projects , :pid
  	remove_column :milestones , :pid
  	remove_column :tasks , :mid
  	remove_column :users , :uid
  end
end
