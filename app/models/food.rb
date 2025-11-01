class Food < ApplicationRecord
  has_and_belongs_to_many :menus


  def self.is_vegan?
    :vegan
  end

  def self.has_pork?
    :pork
  end

  validates :name, format: {with: /[A-Z][a-z].*/ , message: "Capitalize the first letter."}, uniqueness: true
  validates :calories, numericality: { only_integer: true, greater_than: 0 }
  with_options if: has_pork? do |pork_food|
    pork_food.validates :vegan, inclusion: [false]
    pork_food.validates :vegetarian, inclusion: [false]
  end
  with_options if: is_vegan? do |vegan|
    vegan.validates :pork, presence: false
    vegan.validates :vegetarian, presence: true
  end
  with_options inclusion: [true,false] do |tri_state_boolean|
    tri_state_boolean.validates :vegetarian
    tri_state_boolean.validates :vegan
    tri_state_boolean.validates :pork
  end
end
