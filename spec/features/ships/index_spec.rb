require 'rails_helper'

RSpec.describe 'the ship index page' do

  # User Story 3, Child Index 
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  describe 'As a visitor' do
    describe 'When I visit /child_table_name' do
      it 'Then I see each Child in the system including the Childs attributes' do
        admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        ship1 = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: true)
        ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)

        visit "/ships"

        expect(page).to have_content("H.M.S. Surprise")
        expect(page).to have_content(38)
        expect(page).to have_content(1)
        expect(page).to have_content(true)
        expect(page).to have_content("H.M.S. Pollux")
        expect(page).to have_content(74)
        expect(page).to have_content(2)
        expect(page).to have_content(true)

        expect(ship1.ship_name).to appear_before(ship2.ship_name)
      end
    end
  end

  # User Story 8, Child Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index

  describe ' As a visitor' do
    describe 'When I visit any page on the site' do
      it 'Then I see a link at the top of the page that takes me to the Child Index' do
        admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        ship1 = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
        ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)

        visit "/admirals"

        expect(page.has_link?).to eq(true)
        expect(page).to have_link("List of Ships in His Majesty's Navy")
        visit "/admirals/#{admiral.id}"
        expect(page.has_link?).to eq(true)
        expect(page).to have_link("List of Ships in His Majesty's Navy")
        visit "/admirals/#{admiral.id}/ships"
        expect(page.has_link?).to eq(true)
        expect(page).to have_link("List of Ships in His Majesty's Navy")
        visit "ships/#{ship1.id}"
        expect(page.has_link?).to eq(true)
        expect(page).to have_link("List of Ships in His Majesty's Navy")
      end
    end
  end

  # User Story 15, Child Index only shows `true` Records 
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`

  describe ' When I visit the child index' do
    it 'Then I only see records where the boolean column is `true`' do
      admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
      ship1 = admiral.ships.create!(ship_name: "H.M.S. Ajax", guns: 74, number_of_deck: 2, sunk: true)
      ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)
      ship3 = admiral.ships.create!(ship_name: "H.M.S. Victory", guns: 104, number_of_deck: 3, sunk: false)
      ship4 = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)

      visit "/ships"

      expect(page).to have_content(ship1.ship_name)
      expect(page).to have_content(ship2.ship_name)
      expect(page).to_not have_content(ship3.ship_name)
      expect(page).to_not have_content(ship4.ship_name)
    end
  end
end