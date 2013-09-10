class Task < ActiveRecord::Base
  attr_accessible :name, :program_id, :rec, :task, :status, :question, :question_type, :task_answers

  QUESTION_TYPES = { 0 => "yesno", 1=> "block", 2=> "typing"}

  serialize :task_answers,Array

  belongs_to :program
  has_many :answers

end
