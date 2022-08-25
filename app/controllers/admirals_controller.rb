class AdmiralsController < ApplicationController
  def index
    @admirals = Admiral.all
  end
end