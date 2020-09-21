class AddNumberToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :number, :integer
  end
end
