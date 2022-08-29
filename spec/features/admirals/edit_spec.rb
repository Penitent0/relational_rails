require 'rails_helper'

describe 'Update Admirals' do
    # User Story 12, Parent Update
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info

  describe 'As a visitor' do
    describe 'When I visit a parent show page' do
      it 'Then I see a link to update the parent "Update Parent"' do
        admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        visit "/admirals/#{admiral.id}"
        expect(find_link('Update Admiral')[:href].should == "/admirals/#{admiral.id}/edit")
      end
    end
    describe 'When I click the link Update Parent' do
      it 'Then I am taken to /parents/:id/edit where I see a form to edit the parents attributes' do
        admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        visit "/admirals/#{admiral.id}"
        click_on("Update Admiral #{admiral.name}")
        expect(current_path).to eq("/admirals/#{admiral.id}/edit")
        expect(find_field('name').value)
        expect(find_field('age').value)
        expect(find_field('rank').value)
        expect(find_field('killed_in_action').value)
      end
    end
    describe 'When I fill out the form with updated information' do
      describe 'And I click the button to submit the form' do 
        describe 'Then a `PATCH` request is sent to /parents/:id' do
          describe 'the parents info is updated' do
            it 'and I am redirected to the Parents Show page where I see the parents updated info' do
              admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
              visit "/admirals/#{admiral.id}/edit"
              fill_in('name', :with => 'Manley Harte')
              fill_in('age', :with => 65)
              fill_in('rank', :with => 'Rear-Admiral')
              fill_in('killed_in_action', :with => 'true')
              click_button("Update Admiral")
              expect(current_path).to eq("/admirals/#{admiral.id}")
              expect(page).to have_content("Manley Harte")
              expect(page).to have_content(65)
              expect(page).to have_content("Rear-Admiral")
              expect(page).to have_content("true")
            end
          end
        end
      end
    end
  end
end