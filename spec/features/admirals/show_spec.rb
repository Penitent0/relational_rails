require 'rails_helper'

RSpec.describe 'the admirals show page' do

  # User Story 2, Parent Show 
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table

  describe 'As a visitor' do
    describe 'When I visit /parent/:id' do
      describe 'Then I see the parent with that id including the parents attributes' do
        it 'data from each column that is on the parent table' do 
          admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
          visit "/admirals/#{admiral.id}"
          expect(page).to have_content(admiral.name)
          expect(page).to have_content(39)
          expect(page).to have_content(admiral.rank)
          expect(page).to have_content(false)
        end
      end
    end
  end

  # User Story 7, Parent Child Count
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  
  describe 'As a visitor' do
    describe 'When I visit a parents show page' do
      it 'I see a count of the number of children associated with this parent' do
        admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        ship1 = admiral.ships.create!(ship_name: "H.M.S. Phoebe", guns: 36, number_of_deck: 1, sunk: false)
        ship2 = admiral.ships.create!(ship_name: "H.M.S. Sirius", guns: 36, number_of_deck: 1, sunk: false)
        visit "/admirals/#{admiral.id}"
        expect(admiral.ships.count).to eq(2)
        expect(page).to have_content(admiral.ships.count)
      end
    end
  end

  # User Story 10, Parent Child Index Link
  # As a visitor
  # When I visit a parent show page ('/parents/:id')
  # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

  describe 'As a visitor' do
    describe 'When I visit a parent show page /parents/:id' do
      it 'Then I see a link to take me to that parents child_table_name page /parents/:id/child_table_name' do
        admiral1 = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        ship1 = admiral1.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
        ship2 = admiral1.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)
        visit "/admirals/#{admiral1.id}"
        click_on("Ships in Squadron")
        expect(current_path).to eq("/admirals/#{admiral1.id}/ships")
        admiral2 = Admiral.create!(name: "Manley Harte", age: 65, rank: "Rear-Admiral", killed_in_action: true)
        ship1 = admiral2.ships.create!(ship_name: "H.M.S. Leopard", guns: 100, number_of_deck: 3, sunk: true)
        ship2 = admiral2.ships.create!(ship_name: "H.M.S. Polychrest", guns: 38, number_of_deck: 2, sunk: true)
        visit "/admirals/#{admiral2.id}"
        click_on("Ships in Squadron")
        expect(current_path).to eq("/admirals/#{admiral2.id}/ships")
      end
    end
  end
end