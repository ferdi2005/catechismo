class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :person, null: false, foreign_key: true
      t.references :year, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.integer :anno
      t.integer :quota
      t.boolean :quota_versata
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
