require 'rails_helper'

# User Story 13, Parent Child Creation 
# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

describe 'admiral ships creation' do
  describe 'As a visitor' do 
    describe 'When I visit a Parent Children Index page' do
      before :each do
        @admiral = Admiral.create!(name: "Thomas Hardy", age: 39, rank: "Vice-Admiral of the White", killed_in_action: false)
        @ship1 = @admiral.ships.create!(ship_name: "H.M.S. Surprise", guns: 38, number_of_deck: 1, sunk: false)
        @ship2 = @admiral.ships.create!(ship_name: "H.M.S. Pollux", guns: 74, number_of_deck: 2, sunk: true)
      end 

      it 'Then I see a link to add a new adoptable child for that parent Create Child' do
        visit "/admirals/#{@admiral.id}/ships"
        expect(find_link("Add ship to Admiral #{@admiral.name}'s Squadron")[:href].should == "/admirals/#{@admiral.id}/ships/new")
      end

      it "I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child" do 

      end
    end
  end
end