class AdmiralShipsController < ApplicationController
  def ships_index
    # @ships = Ship.all.select { |ship| ship.admiral_id == Admiral.find(params[:id]).id }
    @ships = Admiral.find(params[:id]).ships
  end
end