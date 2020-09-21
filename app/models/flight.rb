class Flight < ApplicationRecord
  belongs_to :airline
  validates_presence_of :number
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers
end
