require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  test "pokemon should be valid" do
    pokemon = Pokemon.new(
      pokemon_number: 1,
      name: "Bulbasaur",
      type_1: "Grass",
      total: 318,
      hp: 45,
      attack: 49,
      defense: 49,
      spe_attack: 65,
      spe_defense: 65,
      speed: 45,
      generation: 1,
      legendary: false
    )
    assert pokemon.valid?
  end

  test "pokemon without required fields should be invalid" do
    pokemon = Pokemon.new
    refute pokemon.valid?
    assert_not_nil pokemon.errors[:pokemon_number]
    assert_not_nil pokemon.errors[:name]
    assert_not_nil pokemon.errors[:type_1]
    assert_not_nil pokemon.errors[:total]
    assert_not_nil pokemon.errors[:hp]
    assert_not_nil pokemon.errors[:attack]
    assert_not_nil pokemon.errors[:defense]
    assert_not_nil pokemon.errors[:spe_attack]
    assert_not_nil pokemon.errors[:spe_defense]
    assert_not_nil pokemon.errors[:speed]
    assert_not_nil pokemon.errors[:generation]
    assert_not_nil pokemon.errors[:legendary]
  end

  test "pokemon with invalid types should be invalid" do
    pokemon = Pokemon.new(
      pokemon_number: 1,
      name: "Bulbasaur",
      type_1: "Invalid Type",
      type_2: "Invalid Type",
      total: 318,
      hp: 45,
      attack: 49,
      defense: 49,
      spe_attack: 65,
      spe_defense: 65,
      speed: 45,
      generation: 1,
      legendary: false
    )
    refute pokemon.valid?
    assert_not_nil pokemon.errors[:type_1]
    assert_not_nil pokemon.errors[:type_2]
  end

  test "pokemon with valid type_2 should be valid" do
    pokemon = Pokemon.new(
      pokemon_number: 1,
      name: "Bulbasaur",
      type_1: "Grass",
      type_2: "Poison",
      total: 318,
      hp: 45,
      attack: 49,
      defense: 49,
      spe_attack: 65,
      spe_defense: 65,
      speed: 45,
      generation: 1,
      legendary: false
    )
    assert pokemon.valid?
  end


  test "pokemon with valid legendary should be valid" do
    pokemon = Pokemon.new(
      pokemon_number: 1,
      name: "Bulbasaur",
      type_1: "Grass",
      type_2: "Poison",
      total: 318,
      hp: 45,
      attack: 49,
      defense: 49,
      spe_attack: 65,
      spe_defense: 65,
      speed: 45,
      generation: 1,
      legendary: true
    )
    assert pokemon.valid?
  end

  test "pokemon with nil type_2 should be valid" do
    pokemon = Pokemon.new(
      pokemon_number: 1,
      name: "Bulbasaur",
      type_1: "Grass",
      total: 318,
      hp: 45,
      attack: 49,
      defense: 49,
      spe_attack: 65,
      spe_defense: 65,
      speed: 45,
      generation: 1,
      legendary: false
    )
    assert pokemon.valid?
  end

  test "pokemon with invalid numerical values should be invalid" do
    pokemon = Pokemon.new(
      pokemon_number: 1,
      name: "Bulbasaur",
      type_1: "Grass",
      total: 525,
      hp: 45.5,
      attack: 265,
      defense: "invalid",
      spe_attack: -10,
      spe_defense: "invalid",
      speed: "invalid",
      generation: 1.5,
      legendary: false
    )
    refute pokemon.valid?
    assert_not_nil pokemon.errors[:total]
    assert_not_nil pokemon.errors[:hp]
    assert_not_nil pokemon.errors[:attack]
    assert_not_nil pokemon.errors[:defense]
    assert_not_nil pokemon.errors[:spe_attack]
    assert_not_nil pokemon.errors[:spe_defense]
    assert_not_nil pokemon.errors[:speed]
    assert_not_nil pokemon.errors[:generation]
  end
end
