class AddAssetPathToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :asset_path, :string
  end
end
