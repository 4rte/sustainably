class Business < ApplicationRecord
  has_many :reviews
  has_many :business_sub_categories
  has_many :sub_categories, through: :business_sub_categories
  accepts_nested_attributes_for :sub_categories, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :business_sub_categories, reject_if: :all_blank, allow_destroy: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def category
    sub_categories.first.category # the category of the business
  end
end
