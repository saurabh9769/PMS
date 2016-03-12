class ChangeColumnNameUidToPidInProject < ActiveRecord::Migration
  def change
  	rename_column :projects, :uid, :pid
  end
end
