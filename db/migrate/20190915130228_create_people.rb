class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :nome
      t.string :cognome
      t.date :battesimo
      t.string :parrocchia
      t.date :data_di_nascita
      t.string :luogo_di_nascita
      t.string :padre
      t.string :madre
      t.integer :telefono
      t.integer :cellulare
      t.string :indirizzo
      t.string :comune
      t.integer :cap
      t.boolean :nulla_osta
      t.boolean :completo, default: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
