class Flight < ApplicationRecord
  belongs_to :airline
  validates_presence_of :name
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers
end
