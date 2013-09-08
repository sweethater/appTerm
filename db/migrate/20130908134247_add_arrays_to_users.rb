class AddArraysToUsers < ActiveRecord::Migration
  def change
    add_column :users, :task_readed ,:text
    add_column :users, :task_percentage, :text
  end
end
