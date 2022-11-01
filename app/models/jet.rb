class Jet < ApplicationRecord
  has_many :reservations, dependent: :delete_all
  has_many :users, through: :reservations

  validates :name, :description, :size, :category, :image, presence: true
  validates :price_per_day, :finance_fee, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
