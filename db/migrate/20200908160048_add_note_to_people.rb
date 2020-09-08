class AddNoteToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :note, :text
  end
end
