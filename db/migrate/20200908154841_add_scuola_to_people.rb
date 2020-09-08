class AddScuolaToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :scuola, :string
    change_column :people, :telefono, :string
  end
end
