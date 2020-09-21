class RemoveNameFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :name, :string
  end
end
