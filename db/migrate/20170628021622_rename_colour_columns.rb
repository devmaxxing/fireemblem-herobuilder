class RenameColourColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :heros, :colour, :color
    rename_column :weapons, :colour, :color
  end
end
