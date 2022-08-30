class Ship < ApplicationRecord
  belongs_to :admiral

  def self.sunk
    Ship.where(sunk: true)
  end
end