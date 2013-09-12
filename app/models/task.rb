class Task < ActiveRecord::Base
  attr_accessible :name, :program_id, :rec, :task, :status, :question, :question_answer, :question_type, :task_answers, :reverse, :good, :bad

  QUESTION_TYPES = { 0 => "yesno", 1=> "block", 2=> "typing"}

  serialize :task_answers,Array

  validates :name, :presence => true, uniqueness: true
  validates :program_id, :presence => true
  validates :question, :presence => true


  belongs_to :program
  has_many :answers

  def regexp_answer(user_answer)

    case self.question_answer[0,2]
    when "=="
      return true if self.question_answer[2..-1].to_i == user_answer

    when "<<"
      return true if user_answer < self.question_answer[2..-1].to_i

    when ">>"
      return true if user_answer > self.question_answer[2..-1].to_i

    when "+-"
      interval_and_number = self.question_answer[2..-1]
      interval = interval_and_number.split(":")[0].to_i
      number = interval_and_number.split(":")[1].to_i

      return true if user_answer.between?(number-interval, number+interval)

    end

    return false

  end

end
