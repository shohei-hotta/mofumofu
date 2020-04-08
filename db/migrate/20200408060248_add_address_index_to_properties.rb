class AddAddressIndexToProperties < ActiveRecord::Migration[5.2]
  def change
    add_index :properties, :address, unique: true
  end
end
