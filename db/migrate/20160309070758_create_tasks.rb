class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :mid
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :status

      t.timestamps null: false
    end
  end
end
