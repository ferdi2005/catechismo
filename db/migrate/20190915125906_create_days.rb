class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.datetime :apertura
      t.datetime :chiusura
      t.float :totale_consegnato

      t.timestamps
    end
  end
end
