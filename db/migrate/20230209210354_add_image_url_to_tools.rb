class AddImageUrlToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :image_url, :string
  end
end
