class Api::V1::PokemonsController < ApplicationController
  before_action :validate_id_param, only: [:show, :update, :destroy]

  private def validate_id_param
    id = params[:id].to_i
    if id.to_s != params[:id] || id <= 1
      render json: { error: "Invalid Pokemon ID" }, status: :bad_request
    end
  end

  private def return_404
    render json: { error: "Pokemon not found" }, status: :not_found
  end

  def index
    begin
      limit = params[:limit] || 10
      offset = params[:offset] || 0
      @pokemons = Pokemon.limit(limit).offset(offset)
      render json: @pokemons
    rescue ArgumentError
      render json: { error: "Invalid parameters, please provide a proper limit and/or offset integer value" }, status: :bad_request
    end
  end

  def show
    begin
      id = params[:id].to_i
      @pokemon = Pokemon.find(id)
      render json: @pokemon
    rescue ActiveRecord::RecordNotFound
      return_404
    end
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
    if @pokemon.save
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def update
    id = params[:id].to_i

    begin
      @pokemon = Pokemon.find(id)
      @pokemon.update(
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
      if @pokemon.save
        render json: @pokemon
      else
        render json: @pokemon.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      return_404
    end
  end

  def destroy
    id = params[:id].to_i

    begin
      @pokemon = Pokemon.find(params[:id])
      @pokemon.destroy
      return head :no_content
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'The Pokemon was not found' }, status: :not_found
    end
  end
end
