require 'rails_helper'

RSpec.describe "When I visit the flights index page ('/flights')" do
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
    @zazu = @flight_4.passengers.create(name: "Zazu C", age: "7")
    @bob = @flight_2.passengers.create(name: "Bobbo B", age: "51")
    @kate = @flight_3.passengers.create(name: "Katie K", age: "28")
  end

  describe "I see a list of all flight numbers" do
    it 'And under each flight number I see the names of all that flights passengers' do
    
      visit '/flights'

      within "#flight-#{@flight_1.id}" do
        expect(page).to have_content("#{@flight_1.name}")
        expect(page).to have_content("#{@corey.name}")
        expect(page).to have_content("#{@anhnhi.name}")
      end

      within "#flight-#{@flight_2.id}" do
        expect(page).to have_content("#{@flight_2.name}")
        expect(page).to have_content("#{@bob.name}")
      end

      within "#flight-#{@flight_3.id}" do
        expect(page).to have_content("#{@flight_3.name}")
        expect(page).to have_content("#{@kate.name}")
      end

      within "#flight-#{@flight_4.id}" do
        expect(page).to have_content("#{@flight_4.name}")
        expect(page).to have_content("#{@zazu.name}")
      end

    end
  end

  describe "You can remove a passenger from a flights index page" do

    it 'shows a link next to each passenger to remove them' do
      visit "/flights"

      within "#passenger-#{@corey.id}" do
        expect(page).to have_link("Remove Passenger")
      end

      within "#passenger-#{@anhnhi.id}" do
        expect(page).to have_link("Remove Passenger")
      end

      within "#passenger-#{@zazu.id}" do
        expect(page).to have_link("Remove Passenger")
      end

    end

    it 'when the link is clicked, the passenger is removed and I stay on the flight index page' do
      visit "/flights"

      within "#passenger-#{@corey.id}" do
        click_link "Remove Passenger"
      end

      expect(current_path).to eq("/flights")
      expect(page).to_not have_content("#{@corey.name}")

    end
  end
end