require 'rails_helper'

RSpec.describe "When I visit an airlines show page ('/airlines/:id')" do
  before(:each) do
    @frontier = Airline.create(name: "Frontier Airlines")
    @southwest = Airline.create(name: "Southwest Airlines")
    @spirit = Airline.create(name: "Spirit Airlines")
    @flight_1 = @frontier.flights.create(number: 123)
    @flight_2 = @southwest.flights.create(number: 789)
    @flight_3 = @spirit.flights.create(number: 543)
    @flight_4 = @frontier.flights.create(number: 432)
    @corey = @flight_1.passengers.create(name: "Corey C", age: "34")
    @anhnhi = @flight_1.passengers.create(name: "Anhnhi T", age: "32")
    @zazu = @flight_4.passengers.create(name: "Zazu C", age: "7")
    @bob = @flight_2.passengers.create(name: "Bobbo B", age: "51")
    @kate = @flight_3.passengers.create(name: "Katie K", age: "28")
  end

    it 'I see a unique list of passengers that have flights from that airline' do

        visit "/airlines/#{@frontier.id}"

        expect(page).to have_content("#{@frontier.name}")
        expect(page).to have_content("#{@corey.name}")
        expect(page).to have_content("#{@anhnhi.name}")
        expect(page).to have_content("#{@zazu.name}")
      save_and_open_page
        expect(page).to_not have_content("#{@bob.name}")
        expect(page).to_not have_content("#{@kate.name}")
    end
end
    