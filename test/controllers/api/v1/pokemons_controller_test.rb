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


end