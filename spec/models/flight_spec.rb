require 'rails_helper'


RSpec.describe Flight, type: :model do
  describe "validations" do
    it {should validate_presence_of :number}
  end

  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many(:passengers).through(:flight_passengers)}
  end
end