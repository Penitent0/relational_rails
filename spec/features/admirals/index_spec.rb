require 'rails_helper'

RSpec.describe 'the admirals index page' do

  # User Story 1, Parent Index
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  
  describe 'For each parent table' do
    describe 'As a visitor' do
      describe 'When I visit /parents' do
        it 'Then I see the name of each parent record in the system' do
          admiral1 = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
          admiral2 = Admiral.create!(name: "Horatio Nelson", age: 49, rank: "Vice-Admiral of the Red", killed_in_action: true)
          visit "/admirals"
          save_and_open_page
          expect(page).to have_content("Thomas Hardy")
          expect(page).to have_content("Horatio Nelson")
        end
      end
    end
  end

  # User Story 6, Parent Index sorted by Most Recently Created 
  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  
  describe 'As a visitor' do
    describe 'When I visit the parent index,' do 
      it 'I see that records are ordered by most recently created first' do
        admiral1 = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        admiral2 = Admiral.create!(name: "Horatio Nelson", age: 49, rank: "Vice-Admiral of the Red", killed_in_action: true)
        visit "/admirals"
        expect(admiral2.name).to appear_before(admiral1.name)
      end

      it 'And next to each of the records I see when it was created' do 
        admiral1 = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        admiral2 = Admiral.create!(name: "Horatio Nelson", age: 49, rank: "Vice-Admiral of the Red", killed_in_action: true)
        visit "/admirals"
        expect(page).to have_content(admiral1.created_at)
        expect(page).to have_content(admiral2.created_at)
      end
    end
  end

  # User Story 9, Parent Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index

  describe 'As a visitor' do
    describe 'When I visit any page on the site' do
      it 'Then I see a link at the top of the page that takes me to the Parent Index' do
        admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        ship1 = admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
        ship2 = admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)
        visit "/admirals/#{admiral.id}"
        expect(page.has_link?).to eq(true)
        expect(page).to have_link("Admiratly List of His Majesty's Navy")
        visit "/ships"
        expect(page.has_link?).to eq(true)
        expect(page).to have_link("Admiratly List of His Majesty's Navy")
        visit "/ships/#{ship1.id}"
        expect(page.has_link?).to eq(true)
        expect(page).to have_link("Admiratly List of His Majesty's Navy")
        visit "/admirals/#{admiral.id}/ships"
        expect(page.has_link?).to eq(true)
        expect(page).to have_link("Admiratly List of His Majesty's Navy")
      end
    end
  end
end