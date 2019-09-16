class AddYearToDays < ActiveRecord::Migration[6.0]
  def change
    add_reference :days, :year, null: true, foreign_key: true
  end
end
