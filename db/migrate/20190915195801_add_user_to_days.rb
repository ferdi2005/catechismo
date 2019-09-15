class AddUserToDays < ActiveRecord::Migration[6.0]
  def change
    add_reference :days, :user, null: false, foreign_key: true
  end
end
