class AdmiralShipsController < ApplicationController
  def ships_index
    @admiral = Admiral.find(params[:id])
  end
end