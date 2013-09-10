class Question < ActiveRecord::Base
  attr_accessible :answer, :question_text, :type



  belongs_to :task
  has_many :answers
end
