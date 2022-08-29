class AdmiralsController < ApplicationController
  def index
    @admirals = Admiral.order('admirals.created_at DESC')
  end

  def show
    @number_of_ships = Admiral.find(params[:id]).ships.count
    @admiral = Admiral.find(params[:id])
  end

  def new

  end

  def create
    admiral = Admiral.create(admirals_params)
    redirect_to '/admirals'
  end

  def edit
    @admiral = Admiral.find(params[:id])
  end

  def update
    admiral = Admiral.find(params[:id])
    admiral.update(admirals_params)
    admiral.save
    redirect_to "/admirals/#{admiral.id}"
  end

private
  def admirals_params
    params.permit(:name, :age, :rank, :killed_in_action)
  end
end