class AddMaxStatsToHeros < ActiveRecord::Migration[5.0]
  def change
    add_column :heros, :max_attack, :integer
    add_column :heros, :max_defense, :integer
    add_column :heros, :max_health, :integer
    add_column :heros, :max_resistance, :integer
    add_column :heros, :max_speed, :integer
  end
end
