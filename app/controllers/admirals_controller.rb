class AdmiralsController < ApplicationController
  def index
    @admirals = Admiral.sort_by_created_at
  end

  def show
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

  def destroy
    admiral = Admiral.find(params[:id])
    admiral.destroy
    redirect_to '/admirals'
  end

private
  def admirals_params
    params.permit(:name, :age, :rank, :killed_in_action)
  end
end