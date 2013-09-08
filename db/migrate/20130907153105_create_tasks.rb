class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :rec
      t.text :task

      t.text :question
      t.string :question_answer
      t.integer :question_type

      t.integer :program_id

      t.timestamps
    end
  end
end
