class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :info
      t.text :program_task
      t.boolean :status

      t.timestamps
    end
  end
end
