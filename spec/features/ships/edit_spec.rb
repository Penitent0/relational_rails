require 'rails_helper'

RSpec.describe 'ship edit page' do

  # User Story 14, Child Update 
  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information

  describe ' When I visit a Child Show page' do
    it 'I see a link to update that Child "Update Child"' do
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship1 = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
      ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)

      visit "ships/#{ship1.id}"
      
      expect(find_link("Update #{ship1.ship_name}")[:href].should == "/ships/#{ship1.id}/edit")

      visit "ships/#{ship2.id}"

      expect(find_link("Update #{ship2.ship_name}")[:href].should == "/ships/#{ship2.id}/edit")
    end

    it 'when I click the link' do
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)

      visit "/ships/#{ship.id}"

      click_on("Update #{ship.ship_name}")
      
      expect(current_path).to eq("/ships/#{ship.id}/edit")
    end 

    it 'I am taken to /child_table_name/:id/edit where I see a form to edit the childs attributes:' do
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)

      visit "/ships/#{ship.id}/edit"

      expect(find_field('ship_name').value)
      expect(find_field('guns').value)
      expect(find_field('number_of_deck').value)
      expect(find_field('sunk').value)
    end

    it 'I am redirected to the Child Show page where I see the Childs updated information' do
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)

      visit "/ships/#{ship.id}/edit"

      fill_in('ship_name', :with => 'H.M.S. Victory')
      fill_in('guns', :with => 104)
      fill_in('number_of_deck', :with => 3)
      fill_in('sunk', :with => 'false')

      click_button("Update Ship")

      expect(current_path).to eq("/ships/#{ship.id}")
      expect(page).to have_content("H.M.S. Victory")
      expect(page).to have_content(104)
      expect(page).to have_content(3)
      expect(page).to have_content("false")
    end
  end
end