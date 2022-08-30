class AdmiralShipsController < ApplicationController
  def ships_index
    @admiral = Admiral.find(params[:id])
    @ships = Admiral.find(params[:id]).ships
  end
end