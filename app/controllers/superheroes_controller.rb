class SuperheroesController < ApplicationController
  before_action :set_superhero, only: [:show]

  def index
    if params[:search]
      @superheroes = Superhero.joins(:superpower).where("superpowers.name LIKE ?", "%#{params[:search]}%")
      @message = "There are no superheroes with that Superpower" if @superheroes.empty?
    else
      @superheroes = Superhero.all
    end
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(superhero_params)
    if @superhero.save
      render :show
    else
      render :new
    end
  end

  def show
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name,:super_name, :superpower_id)
  end

  def set_superhero
    @superhero = Superhero.find_by(id: params[:id])
  end
end