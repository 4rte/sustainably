class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :business
  validates :user, uniqueness: { scope: :business }
end
