class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :delete_user_timer
      t.string :admin_name
      t.string :admin_password

      t.timestamps
    end
  end
end
