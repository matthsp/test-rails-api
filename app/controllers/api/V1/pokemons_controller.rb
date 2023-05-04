class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    render json: @pokemon
  end

  def create
    @pokemon = Pokemon.create(
      pokemon_number: params[:pokemon_number],
      name: params[:name],
      type_1: params[:type_1],
      type_2: params[:type_2],
      total: params[:total],
      hp: params[:hp],
      attack: params[:attack],
      defense: params[:defense],
      spe_attack: params[:spe_attack],
      spe_defense: params[:spe_defense],
      speed: params[:speed],
      generation: params[:generation],
      legendary: params[:legendary]
    )
    render json: @pokemon
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(
      pokemon_number: params[:pokemon_number],
      name: params[:name],
      type_1: params[:type_1],
      type_2: params[:type_2],
      hp: params[:hp],
      attack: params[:attack],
      defense: params[:defense],
      spe_attack: params[:spe_attack],
      spe_defense: params[:spe_defense],
      speed: params[:speed],
      generation: params[:generation],
      legendary: params[:legendary]
    )
    render json: @pokemon
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    head :no_content
  end
end
