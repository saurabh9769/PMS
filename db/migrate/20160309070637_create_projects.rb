class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :uid
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
