class Admiral < ApplicationRecord
  has_many :ships, :dependent => :destroy

  def number_of_ships
    self.ships.count
  end

  def ships_alphabetized
    self.ships.order('ships.ship_name ASC')
  end
end