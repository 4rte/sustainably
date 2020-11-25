class BusinessSubCategory < ApplicationRecord
  belongs_to :business
  belongs_to :sub_category
end
