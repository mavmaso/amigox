class DrawsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @draws = Draw.all
  end

  def show
    @draw = Draw.find(params[:id])
  end
end
