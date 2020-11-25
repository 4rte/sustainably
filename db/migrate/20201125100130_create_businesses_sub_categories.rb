class CreateBusinessesSubCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses_sub_categories do |t|
      t.references :business, null: false, foreign_key: true
      t.references :sub_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
