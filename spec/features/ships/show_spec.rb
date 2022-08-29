require 'rails_helper'

RSpec.describe 'the ships show page' do

  # User Story 4, Child Show
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  describe 'As a vistor' do
    describe 'When I visit /child_table_name/:id' do
      it 'Then I see the child with that id including the childs attributes' do
        admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        ship = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
        visit "/ships/#{ship.id}"
        expect(page).to have_content(ship.ship_name)
        expect(page).to have_content(ship.guns)
        expect(page).to have_content(ship.number_of_deck)
        expect(page).to have_content(ship.sunk)
      end
    end
  end
end