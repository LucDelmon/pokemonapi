require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pokemon.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Pokemon.create!(
    number: row['#'].to_i,
    name: row['Name'],
    type1: row['Type 1'],
    type2: row['Type 2'],
    total: row['Total'].to_i,
    hp: row['HP'].to_i,
    attack: row['Attack'].to_i,
    defense: row['Defense'].to_i,
    sp_attack: row['Sp. Atk'].to_i,
    sp_defence: row['Sp. Def'].to_i,
    speed: row['Speed'].to_i,
    generation: row['Generation'].to_i,
    legendary: ActiveRecord::Type::Boolean.new.cast(row['Legendary']),
  )
end
