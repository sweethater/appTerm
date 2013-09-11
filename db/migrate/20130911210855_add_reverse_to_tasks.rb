class AddReverseToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :reverse, :text
  end
end
