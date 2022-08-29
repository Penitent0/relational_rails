class AdmiralShipsController < ApplicationController
  def ships_index
    # admiral = Admiral.find(params[:id])
    # @ships = admiral.ships
    @ships = Admiral.find(params[:id]).ships
    @admiral = Admiral.find(params[:id])
  end
end