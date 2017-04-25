class AddColourToWeapons < ActiveRecord::Migration[5.0]
  def change
    add_column :weapons, :colour, :string
  end
end
