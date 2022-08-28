require 'rails_helper'

RSpec.describe 'the admirals ships index page' do

  # User Story 5, Parent Children Index 
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  describe 'As a visitor' do
    describe 'When I visit /parents/:parent_id/child_table_name' do
      it 'Then I see each Child that is associated with that Parent with each Childs attributes:' do
        admiral1 = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        ship1 = admiral1.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
        ship2 = admiral1.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)
        admiral2 = Admiral.create!(name: "Horatio Nelson", age: 47, rank: "Vice-Admiral of the Red", killed_in_action: true)
        ship3 = admiral2.ships.create!(ship_name: "H.M.S. Victory", guns: 104, number_of_deck: 3, sunk: false)
        ship4 = admiral2.ships.create!(ship_name: "H.M.S. Ajax", guns: 74, number_of_deck: 2, sunk: false)

        visit "/admirals/#{admiral1.id}/ships"
        save_and_open_page
        expect(page).to have_content("H.M.S. Surprise")
        expect(page).to have_content("H.M.S. Pollux")
        expect(page).to_not have_content("H.M.S. Victory")
        expect(page).to_not have_content("H.M.S. Ajax")
        expect(ship1.ship_name).to appear_before(ship2.ship_name)
      
        visit "/admirals/#{admiral2.id}/ships"
        save_and_open_page
        expect(page).to have_content("H.M.S. Victory")
        expect(page).to have_content("H.M.S. Ajax")
        expect(page).to_not have_content("H.M.S. Surprise")
        expect(page).to_not have_content("H.M.S. Pollux")
        expect(ship3.ship_name).to appear_before(ship4.ship_name)
      end
    end
  end
end