class Task < ActiveRecord::Base
  attr_accessible :name, :program_id, :rec, :task, :status, :question, :question_answer, :question_type, :task_answers

  QUESTION_TYPES = { 0 => "yesno", 1=> "block", 2=> "typing"}

  serialize :task_answers,Array

  validates :name, :presence => true, uniqueness: true
  validates :program_id, :presence => true
  validates :question, :presence => true


  belongs_to :program
  has_many :answers

end
