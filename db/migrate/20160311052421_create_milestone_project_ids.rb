class CreateMilestoneProjectIds < ActiveRecord::Migration
  def change
    create_table :milestone_project_ids do |t|
    	t.integer :milestone_id 
    	t.integer :project_id
      t.timestamps null: false
    end
  end
end
