require 'test_helper'

class Api::V1::PokemonsControllerTest < ActionDispatch::IntegrationTest
  fixtures :pokemons

  test "should get all records,  with default offset and limit values" do
    # Make a GET request to the API endpoint
    get api_v1_pokemons_url

    # Expect the response to have a 200 status code
    assert_response :success

    # Parse the response body as JSON
    json = JSON.parse(response.body)

    # Expect the JSON response to contain the correct data
    assert_equal 3, json.length
    assert_equal "Bulbasaur", json[0]['name']
    assert_equal "Ivysaur", json[1]['name']
    assert_equal "Venusaur", json[2]['name']
  end

  test "should get first 2 records" do
    # Make a GET request to the API endpoint
    get api_v1_pokemons_url, params: { limit: 2, offset: 0 }

    # Expect the response to have a 200 status code
    assert_response :success

    # Parse the response body as JSON
    json = JSON.parse(response.body)

    # Expect the JSON response to contain the correct data
    assert_equal 2, json.length
    assert_equal "Bulbasaur", json[0]['name']
    assert_equal "Ivysaur", json[1]['name']
  end

  test "should get the third record" do
    # Make a GET request to the API endpoint
    get api_v1_pokemons_url, params: { limit: 2, offset: 2 }

    # Expect the response to have a 200 status code
    assert_response :success

    # Parse the response body as JSON
    json = JSON.parse(response.body)

    # Expect the JSON response to contain the correct data
    assert_equal 1, json.length
    assert_equal "Venusaur", json[0]['name']
  end

  test "should get the pokemon by id 2" do
    pokemon = pokemons(:ivysaur)

    # Make a GET request to the API endpoint
    get api_v1_pokemon_url(2)

    # Expect the response to have a 200 status code
    assert_response :success

    # Parse the response body as JSON
    json = JSON.parse(response.body)

    # Expect the JSON response to contain the correct data
    assert_equal pokemon.attributes, json
  end

  test "should create a new pokemon" do
    assert_difference('Pokemon.count') do
      post api_v1_pokemons_url, params: { pokemon_number: 25, name: 'Pikachu', type_1: 'Electric', total: 320, hp: 35, attack: 55, defense: 40, spe_attack: 50, spe_defense: 50, speed: 90, generation: 1, legendary: false }
    end

    json = JSON.parse(response.body)

    assert_equal 'Pikachu', json['name']
  end

  test "should update an existing pokemon" do
    pokemon = Pokemon.create(pokemon_number: 25, name: 'Pikachu', type_1: 'Electric', total: 320, hp: 35, attack: 55, defense: 40, spe_attack: 50, spe_defense: 50, speed: 90, generation: 1, legendary: false)

    patch api_v1_pokemon_url(pokemon), params: { pokemon_number: 25, name: 'Pikachu (updated)', type_1: 'Electric', total: 330, hp: 35, attack: 55, defense: 40, spe_attack: 60, spe_defense: 50, speed: 100, generation: 1, legendary: false }

    json = JSON.parse(response.body)

    pokemon.reload

    assert_equal 'Pikachu (updated)', pokemon.name
    assert_equal json['name'], pokemon.name
    assert_equal 330, pokemon.total
    assert_equal 60, pokemon.spe_attack
    assert_equal 100, pokemon.speed
  end
end