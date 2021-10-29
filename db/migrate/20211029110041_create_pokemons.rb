class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.string :type1, null: false
      t.string :type2
      t.integer :total, null: false
      t.integer :hp, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.integer :sp_attack, null: false
      t.integer :sp_defence, null: false
      t.integer :speed, null: false
      t.integer :generation, null: false
      t.boolean :legendary, null: false

      t.timestamps
    end
  end
end
