class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :jet
  validates :starting_day, :finish_day, :city, presence: true
end
