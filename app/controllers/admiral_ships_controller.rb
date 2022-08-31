class AdmiralShipsController < ApplicationController
  def ships_index
    if params[:status] == "activated"
      binding.pry
      @admiral = Admiral.find(params[:id]).ships_alphabetized
    else
      @admiral = Admiral.find(params[:id])
    end 
  end
end