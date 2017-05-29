class AddBaseStatsToHeroes < ActiveRecord::Migration[5.0]
  def change
    add_column :heros, :base_health, :integer
    add_column :heros, :base_attack, :integer
    add_column :heros, :base_defense, :integer
    add_column :heros, :base_speed, :integer
    add_column :heros, :base_resistance, :integer
  end
end
