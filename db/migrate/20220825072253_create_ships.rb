class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.string :ship_name
      t.integer :guns
      t.integer :number_of_deck
      t.boolean :sunk

      t.timestamps
    end
  end
end
