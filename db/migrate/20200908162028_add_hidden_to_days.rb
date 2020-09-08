class AddHiddenToDays < ActiveRecord::Migration[6.0]
  def change
    add_column :days, :hidden, :boolean, default: false
  end
end
