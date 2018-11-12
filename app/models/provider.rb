class Provider < ApplicationRecord
  has_many :pixel, dependent: :destroy
  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
end
