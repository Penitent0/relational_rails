require 'rails_helper'

RSpec.describe 'the ships destroy method' do

  # User Story 20, Child Delete 
  # As a visitor
  # When I visit a child show page
  # Then I see a link to delete the child "Delete Child"
  # When I click the link
  # Then a 'DELETE' request is sent to '/child_table_name/:id',
  # the child is deleted,
  # and I am redirected to the child index page where I no longer see this child

  describe 'When I visit a child show page' do
    it 'Then I see a link to delete the child "Delete Child"' do
      admiral1 = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship1 = admiral1.ships.create!(ship_name: "H.M.S. Phoebe", guns: 36, number_of_deck: 1, sunk: true)

      visit "/ships/#{ship1.id}"

      expect(find_link("Decommission #{ship1.ship_name}")[:href].should == "/ships/#{ship1.id}")
    end

    describe 'When I click the link' do
      it 'the child is deleted and I am redirected to the child index page where I no longer see the child' do
        admiral1 = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        ship1 = admiral1.ships.create!(ship_name: "H.M.S. Phoebe", guns: 36, number_of_deck: 1, sunk: true)
        admiral2 = Admiral.create!(name: "Cuthbert Collingwood", age: 56, rank: "Rear-Admiral of the Blue", killed_in_action: false)
        ship2 = admiral2.ships.create!(ship_name: "H.M.S. Sirius", guns: 104, number_of_deck: 3, sunk: true)

        visit "/ships/#{ship1.id}"

        click_on("Decommission #{ship1.ship_name}")

        expect(current_path).to eq("/ships")

        expect(page).to_not have_content(ship1.ship_name)
        expect(page).to have_content(ship2.ship_name)
      end
    end
  end
end