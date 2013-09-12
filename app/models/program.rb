class Program < ActiveRecord::Base
  attr_accessible :info, :name, :program_task, :status, :mp3

  has_attached_file :mp3,
                    :url => ":rails_root/public/:filename",
                    :path => ":rails_root/public/:filename"

  has_many :users, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :info, :presence => true


end
