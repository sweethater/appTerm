class Program < ActiveRecord::Base
  attr_accessible :info, :name, :program_task, :status

  has_many :users
  has_many :tasks

  validates :name, :presence => true


end
