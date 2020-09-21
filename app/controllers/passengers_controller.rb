class PassengersController < ApplicationController

    def destroy
        passenger = FlightPassenger.find(params[:id])
        passenger.destroy!
        redirect_to "/flights"
    end

    def index
        @passengers = Passenger.all
    end
    
end