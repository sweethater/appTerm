class AddLastTaskNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_task_number, :integer
  end
end
