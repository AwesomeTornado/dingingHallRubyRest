class Location < ApplicationRecord
  has_and_belongs_to_many :locations
  validates :name, presence: true
  validates :open, format: { with: /(\d{1,2}:\d{2}AM|PM)|Never/, message: "Not a valid time"}
  validates :close, format: { with: /(\d{1,2}:\d{2}AM|PM)|Never/, message: "Not a valid time"}


end
