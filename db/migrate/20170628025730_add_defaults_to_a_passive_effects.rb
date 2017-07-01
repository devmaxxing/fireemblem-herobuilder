class AddDefaultsToAPassiveEffects < ActiveRecord::Migration[5.0]
  def change
    change_column_default :a_passives, :effect_attack, 0
    change_column_default :a_passives, :effect_defense, 0
    change_column_default :a_passives, :effect_health, 0
    change_column_default :a_passives, :effect_resistance, 0
    change_column_default :a_passives, :effect_speed, 0
  end
end
