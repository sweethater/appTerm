class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text
      t.string :answer
      t.integer :type
      t.boolean :status

      t.integer :task_id

      t.timestamps
    end
  end
end
