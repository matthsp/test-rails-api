class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.integer "pokemon_number", limit: 2
      t.string "name", limit: 50, null: false
      t.string "type_1", limit: 10, null: false
      t.string "type_2", limit: 10
      t.integer "total", null: false
      t.integer "hp", null: false
      t.integer "attack", null: false
      t.integer "defense", null: false
      t.integer "spe_attack", null: false
      t.integer "spe_defense", null: false
      t.integer "speed", null: false
      t.integer "generation", null: false
      t.boolean "legendary", default: false, null: false
    end
  end
end