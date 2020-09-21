require 'rails_helper'

RSpec.describe "When I visit the flights index page ('/flights')" do
  before(:each) do
    @frontier = Airline.create(name: "Frontier Airlines")
    @flight_1 = @frontier.flights.create(name: 'XYZ123')
    @flight_2 = @frontier.flights.create(name: 'ABC789')
    @corey = @flight_1.passengers.create(name: "Corey C", age: "34")
    @anhnhi = @flight_1.passengers.create(name: "Anhnhi T", age: "32")
    @zazu = @flight_1.passengers.create(name: "Zazu C", age: "7")
    @bob = @flight_2.passengers.create(name: "Bobbo B", age: "51")
    @kate = @flight_2.passengers.create(name: "Katie K", age: "28")
  end

  describe "I see a list of all flight numbers" do
    it 'And under each flight number I see the names of all that flights passengers' do
    
      visit '/flights'

      within "#flight-#{@flight_1.id}" do
        expect(page).to have_content("#{@flight_1.name}")
        expect(page).to have_content("#{@corey.name}")
        expect(page).to have_content("#{@anhnhi.name}")
        expect(page).to have_content("#{@zazu.name}")
      end
      save_and_open_page
      within "#flight-#{@flight_2.id}" do
        expect(page).to have_content("#{@flight_2.name}")
        expect(page).to have_content("#{@bob.name}")
        expect(page).to have_content("#{@kate.name}")
      end
    end
  end
end