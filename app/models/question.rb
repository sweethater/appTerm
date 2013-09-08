class Question < ActiveRecord::Base
  attr_accessible :answer, :question_text, :type

  QUESTION_TYPES = { 0 => "yesno", 1=> "block", 2=> "typing"}

  belongs_to :task
  has_many :answers
end
