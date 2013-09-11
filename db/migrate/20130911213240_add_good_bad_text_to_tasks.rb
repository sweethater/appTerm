class AddGoodBadTextToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :good, :text
    add_column :tasks, :bad, :text
  end
end
