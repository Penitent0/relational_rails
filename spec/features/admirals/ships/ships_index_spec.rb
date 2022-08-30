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

        expect(page).to have_content(ship1.ship_name)
        expect(page).to have_content(ship2.ship_name)
        expect(page).to_not have_content(ship3.ship_name)
        expect(page).to_not have_content(ship4.ship_name)
        expect(ship1.ship_name).to appear_before(ship2.ship_name)

        visit "/admirals/#{admiral2.id}/ships"

        expect(page).to have_content(ship3.ship_name)
        expect(page).to have_content(ship4.ship_name)
        expect(page).to_not have_content(ship1.ship_name)
        expect(page).to_not have_content(ship2.ship_name)
        expect(ship3.ship_name).to appear_before(ship4.ship_name)
      end
    end
  end

  # User Story 16, Sort Parent's Children in Alphabetical Order by name 
  # As a visitor
  # When I visit the Parent's children Index Page
  # Then I see a link to sort children in alphabetical order
  # When I click on the link
  # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

  describe 'I visit the parent child index page' do
    it 'I see a link to sort the children alphabetically' do
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship1 = admiral.ships.create!(ship_name: "H.M.S. Ajax", guns: 74, number_of_deck: 2, sunk: false)
      ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)
      ship3 = admiral.ships.create!(ship_name: "H.M.S. Victory", guns: 104, number_of_deck: 3, sunk: true)

      visit "/admirals/#{admiral.id}/ships"

      expect(find_link('Sort Squadron Alphabetically')[:href].should == "/admirals/#{admiral.id}/ships")
    end

    it 'when I click it I go back and see the chidren sorted alphabetically' do
      
    end
  end

  # User Story 18, Child Update From Childs Index Page 
  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14

  describe 'When I visit the `child_table_name` index page or a parent `child_table_name` index page' do
    it 'Next to every child in the parent child index, I see a link to edit that childs info' do 
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship1 = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: true)
      ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)

      visit "/admirals/#{admiral.id}/ships"

      expect(find_link("Update #{ship1.ship_name}")[:href].should == "/ships/#{ship1.id}/edit")
      expect(find_link("Update #{ship2.ship_name}")[:href].should == "/ships/#{ship2.id}/edit")
    end

    it 'next to every child in the child index I see a link to edit the childs info' do
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship1 = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: true)
      ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)

      visit "/ships/"

      expect(find_link("Update #{ship1.ship_name}")[:href].should == "/ships/#{ship1.id}/edit")
      expect(find_link("Update #{ship2.ship_name}")[:href].should == "/ships/#{ship2.id}/edit")
    end
  end
end