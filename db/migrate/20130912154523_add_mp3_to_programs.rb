class AddMp3ToPrograms < ActiveRecord::Migration
  def change
    add_attachment :programs, :mp3
  end
end
