require 'rails_helper'

RSpec.describe Ship, type: :model do
  it {should belong_to :admiral}

  it 'should have sunk class method' do
    admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
    ship1 = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
    ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: false)
    ship3 = admiral.ships.create!(ship_name: "H.M.S. Victory", guns: 104, number_of_deck: 3, sunk: true)
    ship4 = admiral.ships.create!(ship_name: "H.M.S. Ajax", guns: 74, number_of_deck: 2, sunk: true)

    expect(Ship.sunk).to eq([ship3, ship4])
  end
end