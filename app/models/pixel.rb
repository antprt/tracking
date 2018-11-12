class Pixel < ApplicationRecord
  belongs_to :provider
  validates :provider, presence: true
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 100 }

  before_validation :convert_name_without_space

  def convert_name_without_space
    self.name = self.name.gsub(" ","")
  end
end