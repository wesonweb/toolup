class ChangePostcodeToAddressInToolsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :tools, :postcode, :address
  end
end
