class Menu < ApplicationRecord
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :foods
  validates :name, presence: true
end
