class Task < ActiveRecord::Base
  attr_accessible :name, :program_id, :rec, :task, :status

  belongs_to :program
  has_many :answers

end
