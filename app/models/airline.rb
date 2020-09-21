class Airline < ApplicationRecord
    has_many :flights
    has_many :passengers, through: :flights
    validates_presence_of :name


    def unique_passengers
        self.passengers.uniq
    end
end
