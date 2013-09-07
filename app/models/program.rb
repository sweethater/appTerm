class Program < ActiveRecord::Base
  attr_accessible :info, :name

  has_many :users

  validates :name, :presence => true


end
