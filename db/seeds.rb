require 'csv'

puts 'Opening CSV seed file ...'
csv_text = File.read(Rails.root.join('lib','seeds','pokemon.csv'))
puts 'CSV file opened, parsing ...'
csv_parsed = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')

puts 'CSV file parsed, inserting rows ...'
csv_parsed.each do |row|
  pokemon = Pokemon.new
  pokemon.pokemon_number = row['#']
  pokemon.name = row['Name']
  pokemon.type_1 = row['Type 1']
  pokemon.type_2 = row['Type 2']
  pokemon.total = row['Total']
  pokemon.hp = row['HP']
  pokemon.attack = row['Attack']
  pokemon.defense = row['Defense']
  pokemon.spe_attack = row['Sp. Atk']
  pokemon.spe_defense = row['Sp. Def']
  pokemon.speed = row['Speed']
  pokemon.generation = row['Generation']
  pokemon.legendary = row['Legendary']
  pokemon.save
end

puts 'Injection has ended'