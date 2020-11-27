class AddAssetPathToSubCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :sub_categories, :asset_path, :string
  end
end
