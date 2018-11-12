class Pixel < ApplicationRecord
  belongs_to :provider
  validates :provider, presence: true
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 100 }
end