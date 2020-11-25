class BusinessSubCategory < ApplicationRecord
  belongs_to :business
  belongs_to :sub_category

  # attr_accessible :sub_category, :business
end
