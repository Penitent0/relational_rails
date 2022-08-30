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

  # User Story 15, Child Index only shows `true` Records
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`

  describe 'When I visit the child index' do
    before :each do
      @admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      @ship1 = @admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
      @ship2 = @admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: false)
      @ship3 = @admiral.ships.create!(ship_name: "H.M.S. Leopard", guns: 100, number_of_deck: 3, sunk: true)
      @ship4 = @admiral.ships.create!(ship_name: "H.M.S. Polychrest", guns: 38, number_of_deck: 2, sunk: true)
    end
    it 'Then I only see records where the boolean column is true' do
      visit "/ships"

      expect(page).to have_content(@ship3.ship_name)
      expect(page).to have_content(@ship4.ship_name)
    end

    it 'then I do not see records where the boolean column is false' do
      visit "/ships"

      expect(page).to_not have_content(@ship1.ship_name)
      expect(page).to_not have_content(@ship2.ship_name)
    end
  end
end