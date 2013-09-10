class User < ActiveRecord::Base
  attr_accessible :answers, :name, :program_id, :program_status, :task_readed, :task_percentage

  belongs_to :program

  serialize :task_readed, Array
  serialize :task_percentage, Array

  validates :name, :presence => true, :length => { :minimum => 2, :maximum => 8}
  validates_uniqueness_of :name#, :scope => :program_id, :case_sensitive => false


  def self.scope_search(user_name)
      user_programs = []
      programs = Program.all
      programs.each do |program|
        program.users.each do |u|
          if u == user_name
            @user_programs << program
          end
        end
      end
      user_programs
  end

end
