class AddEffectsToAPassives < ActiveRecord::Migration[5.0]
  def change
    add_column :a_passives, :effect_health, :integer
    add_column :a_passives, :effect_speed, :integer
    add_column :a_passives, :effect_attack, :integer
    add_column :a_passives, :effect_defense, :integer
    add_column :a_passives, :effect_resistance, :integer
  end
end
