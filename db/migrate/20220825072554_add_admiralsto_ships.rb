class AddAdmiralstoShips < ActiveRecord::Migration[5.2]
  def change
    add_reference :ships, :admiral, foreign_key: true
  end
end
