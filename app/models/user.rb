class User < ActiveRecord::Base
  attr_accessible :answers, :name

  belongs_to :program

  validates :name, :presence => true, :length => { :minimum => 2, :maximum => 8}
  validates_uniqueness_of :name, :case_sensitive => false

end
