class CreateUserProjectIds < ActiveRecord::Migration
  def change
    create_table :user_project_ids do |t|
    	t.integer "user_id" 
    	t.integer "project_id"
      	t.timestamps null: false
    end
  end
end
