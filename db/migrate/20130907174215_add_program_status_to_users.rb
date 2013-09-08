class AddProgramStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :program_status, :boolean, :default => 0
  end
end
