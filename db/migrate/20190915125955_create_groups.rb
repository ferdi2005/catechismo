class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :nome
      t.references :year, null: false, foreign_key: true
      t.integer :anno

      t.timestamps
    end
  end
end
