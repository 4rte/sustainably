class RemoveCategoryIdFromBusinesses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :businesses, :category, index: true
  end
end
