class AddCoordinatesToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :latitude, :float
    add_column :tools, :longitude, :float
  end
end
