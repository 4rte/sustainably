class Business < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :sub_categories, through: :categories
end
