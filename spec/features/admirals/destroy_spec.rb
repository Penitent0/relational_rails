require 'rails_helper'

RSpec.describe 'the admirals destroy method' do

  # User Story 19, Parent Delete 
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to delete the parent
  # When I click the link "Delete Parent"
  # Then a 'DELETE' request is sent to '/parents/:id',
  # the parent is deleted, and all child records are deleted
  # and I am redirected to the parent index page where I no longer see this parent

  describe 'When I visit a parent show page' do
    it 'Then I see a link to delete the parent' do
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)

      visit "/admirals/#{admiral.id}"

      expect(find_link("Retire Admiral #{admiral.name}")[:href].should == "/admirals/#{admiral.id}")
    end

    describe 'When I click the link "Delete Parent"' do 
      it 'the parent is deleted, and all child records are deleted' do
        admiral1 = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        admiral2 = Admiral.create!(name: "Cuthbert Collingwood", age: 56, rank: "Rear-Admiral of the Blue", killed_in_action: false)
        ship1 = admiral1.ships.create!(ship_name: "H.M.S. Phoebe", guns: 36, number_of_deck: 1, sunk: true)
        ship2 = admiral1.ships.create!(ship_name: "H.M.S. Sirius", guns: 104, number_of_deck: 3, sunk: true)
        ship3 = admiral2.ships.create!(ship_name: "H.M.S. Surprise", guns: 36, number_of_deck: 1, sunk: true)
        ship4 = admiral2.ships.create!(ship_name: "H.M.S. Ajax", guns: 74, number_of_deck: 2, sunk: true)

        visit "/admirals/#{admiral1.id}"

        click_on("Retire Admiral #{admiral1.name}")

        expect(current_path).to eq("/admirals")

        expect(page).to_not have_content(admiral1.name)
        expect(page).to have_content(admiral2.name)

        visit "/ships"

        expect(page).to_not have_content(ship1.ship_name)
        expect(page).to_not have_content(ship2.ship_name)
        expect(page).to have_content(ship3.ship_name)
        expect(page).to have_content(ship4.ship_name)
      end
    end
  end
end