require 'rails_helper'

# User Story 11, Parent Creation 
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

describe 'New Admiral Creation' do
  describe 'As a visitor' do
    describe 'When I visit the Parent Index page' do
      it 'Then I see a link to create a new Parent record, New Parent' do

        visit "/admirals"

        expect(page.has_link?).to eq(true)
        expect(page).to have_link("New Admiral")
        expect(find_link('New Admiral')[:href].should == '/admirals/new')
      end
    end

    describe 'When I click this link' do
      it 'Then I am taken to /parents/new where I see a form for a new parent record' do

        visit "/admirals"

        click_link('New Admiral')

        expect(current_path).to eq("/admirals/new")
        expect(page).to have_content("Create New Admiral")
        expect(page.has_field?).to eq(true)
        expect(find_field('name').value)
        expect(find_field('age').value)
        expect(find_field('rank').value)
        expect(find_field('killed_in_action').value)
      end
    end

    describe 'When I fill out the form with a new parents attributes:' do
      describe 'And I click the button "Create Parent" to submit the form' do
        describe 'Then a `POST` request is sent to the /parents route,' do
          describe 'a new parent record is created' do
            it 'and I am redirected to the Parent Index page where I see the new Parent displayed' do

              visit "/admirals/new"

              fill_in('name', :with => 'Manley Harte')
              fill_in('age', :with => 65)
              fill_in('rank', :with => 'Rear-Admiral')
              fill_in('killed_in_action', :with => 'true')

              click_button("Create Admiral")

              expect(current_path).to eq("/admirals")
              expect(page).to have_content("Manley Harte")
            end
          end
        end
      end
    end
  end
end 