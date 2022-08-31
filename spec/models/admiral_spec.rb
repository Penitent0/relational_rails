require 'rails_helper'

RSpec.describe Admiral, type: :model do
  it {should have_many :ships}

  it 'number of ships method' do
    admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
    ship1 = admiral.ships.create!(ship_name: "H.M.S. Phoebe", guns: 36, number_of_deck: 1, sunk: false)
    ship2 = admiral.ships.create!(ship_name: "H.M.S. Sirius", guns: 36, number_of_deck: 1, sunk: false)

    expect(admiral.number_of_ships).to eq(2)
  end

  it 'has ships alphabetized method' do
    admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
    ship1 = admiral.ships.create!(ship_name: "H.M.S. Phoebe", guns: 36, number_of_deck: 1, sunk: false)
    ship2 = admiral.ships.create!(ship_name: "H.M.S. Sirius", guns: 36, number_of_deck: 1, sunk: false)
    ship3 = admiral.ships.create!(ship_name: "H.M.S. Ajax", guns: 74, number_of_deck: 2, sunk: false)
    ship4 = admiral.ships.create!(ship_name: "H.M.S. Victory", guns: 104, number_of_deck: 3, sunk: false)

    expect(admiral.ships).to eq([ship1, ship2, ship3, ship4])
    expect(admiral.ships_alphabetized).to eq([ship3, ship1, ship2, ship4])
  end

  it 'has order by name method' do
    admiral1 = Admiral.create!(name: "Thomas Hardy", age: 65, rank: "Rear-Admiral", killed_in_action: false)
    admiral2 = Admiral.create!(name: "Horatio Nelson", age: 39, rank: "Vice-Admiral of the White", killed_in_action: true)
    admiral3 = Admiral.create!(name: "Cuthbert Collingwood", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)

    expect(Admiral.sort_by_created_at).to eq([admiral3, admiral2, admiral1])
  end
end