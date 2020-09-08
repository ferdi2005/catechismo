class AddBattesimosconosciutoToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :battesimosconosciuto, :boolean, default: false
  end
end
