class SuperpowersController < ApplicationController
  before_action :set_superpower, only:[:show]
  def index
    @superpowers = Superpower.all
  end

  def show
  end

  private

  def set_superpower
    @superpower = Superpower.find_by(id: params[:id])
  end
end
