class AdmiralsController < ApplicationController
  def index
    @admirals = Admiral.order('admirals.created_at DESC')
  end

  def show
    @number_of_ships = Admiral.find(params[:id]).ships.count
    @admiral = Admiral.find(params[:id])
  end

  # def ships_index
  #   # @ships = Ship.all.select { |ship| ship.admiral_id == Admiral.find(params[:id]).id }
  #   @ships = Admiral.find(params[:id]).ships
  # end
end