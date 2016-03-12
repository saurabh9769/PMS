class CreateMilestoneTaskIds < ActiveRecord::Migration
  def change
    create_table :milestone_task_ids do |t|
    	t.integer :milestone_id 
    	t.integer :task_id
      t.timestamps null: false
    end
  end
end
