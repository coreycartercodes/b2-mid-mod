require 'rails_helper'

RSpec.describe "When I visit the passengers index page ('/passengers')" do
  before(:each) do
    @frontier = Airline.create(name: "Frontier Airlines")
    @southwest = Airline.create(name: "Southwest Airlines")
    @spirit = Airline.create(name: "Spirit Airlines")
    @flight_1 = @frontier.flights.create(name: 'XYZ123')
    @flight_2 = @southwest.flights.create(name: 'ABC789')
    @flight_3 = @spirit.flights.create(name: 'GHJ543')
    @flight_4 = @frontier.flights.create(name: 'BNM432')
    @corey = @flight_1.passengers.create(name: "Corey C", age: "34")
    @anhnhi = @flight_1.passengers.create(name: "Anhnhi T", age: "32")
    FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @corey.id)
    FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @anhnhi.id)
    FlightPassenger.create(flight_id: @flight_3.id, passenger_id: @corey.id)
    FlightPassenger.create(flight_id: @flight_4.id, passenger_id: @corey.id)
  end

    describe "I see a list of all passengers" do
        it 'And under each passenger I see the names of all their flights and total count ' do
    
            visit '/passengers'

            within "#passenger-#{@corey.id}" do
                expect(page).to have_content("#{@flight_1.name}")
                expect(page).to have_content("#{@flight_2.name}")
                expect(page).to have_content("#{@flight_3.name}")
                expect(page).to have_content("#{@flight_4.name}")
                expect(page).to have_content("4")
            end

            within "#passenger-#{@anhnhi.id}" do
                expect(page).to have_content("#{@flight_1.name}")
                expect(page).to have_content("#{@flight_2.name}")
                expect(page).to have_content("2")
            end
        end
    end
end