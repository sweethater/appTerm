class Answer < ActiveRecord::Base
  attr_accessible :answer_text

  belongs_to :task
end
