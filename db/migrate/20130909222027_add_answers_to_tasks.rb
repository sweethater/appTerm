class AddAnswersToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task_answers, :text
  end
end
