class ChangeColumnNameFromTypeToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :tools, :type, :name
  end
end
