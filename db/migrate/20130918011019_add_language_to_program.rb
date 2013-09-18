class AddLanguageToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :language, :string
  end
end
