class BusinessSubCategory < ApplicationRecord
  belongs_to :business
  belongs_to :sub_category
  has_one_attached :photo

  # attr_accessible :sub_category, :business
end
