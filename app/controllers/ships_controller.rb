class ShipsController < ApplicationController
  def index
    @ships = Ship.sunk
  end

  def show
    @ship = Ship.find(params[:id])
  end

  def new
    @admiral = Admiral.find(params[:id])
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def update
    ship = Ship.find(params[:id])
    ship.update(ships_params)
    ship.save
    redirect_to "/ships/#{ship.id}"
  end

  def create
    admiral = Admiral.find(params[:id])
    admiral.ships.create(ships_params)
    redirect_to "/admirals/#{admiral.id}/ships"
  end

  def destroy
    ship = Ship.find(params[:id])
    ship.destroy
    redirect_to '/ships'
  end

private
  def ships_params
    params.permit(:ship_name, :guns, :number_of_deck, :sunk)
  end
end