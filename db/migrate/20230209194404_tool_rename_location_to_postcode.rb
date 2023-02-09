class ToolRenameLocationToPostcode < ActiveRecord::Migration[7.0]
  def change
    rename_column :tools, :location, :postcode
  end
end
