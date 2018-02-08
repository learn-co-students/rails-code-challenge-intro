class SuperheroesController < ApplicationController
  def index
    if params[:superpower_name]
      superpower = Superpower.find_by(name: params[:superpower_name])
      @superheroes = Superhero.where(superpower: superpower)
    else
      @superheroes = Superhero.all
    end
  end

  def show
    @superhero = Superhero.find_by(id: params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.create(superhero_params)
    redirect_to @superhero
  end


  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
