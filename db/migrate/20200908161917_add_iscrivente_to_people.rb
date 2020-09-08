class AddIscriventeToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :iscrivente, :string
  end
end
