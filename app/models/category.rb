class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
  validates :title, presence: true
  has_one_attached :photo
end
