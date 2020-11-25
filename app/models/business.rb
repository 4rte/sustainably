class Business < ApplicationRecord
  has_many :reviews
  has_many :business_sub_categories
  has_many :sub_categories, through: :business_sub_categories
end
