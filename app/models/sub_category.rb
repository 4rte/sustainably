class SubCategory < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  has_many :business_sub_categories
  has_many :businesses, through: :business_sub_categories
end
