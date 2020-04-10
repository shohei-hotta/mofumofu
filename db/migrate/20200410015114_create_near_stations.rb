class CreateNearStations < ActiveRecord::Migration[5.2]
  def change
    create_table :near_stations do |t|
      t.string :route
      t.string :name
      t.integer :minute
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
