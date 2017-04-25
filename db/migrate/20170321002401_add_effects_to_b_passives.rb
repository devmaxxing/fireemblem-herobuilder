class AddEffectsToBPassives < ActiveRecord::Migration[5.0]
  def change
    add_column :b_passives, :effect, :string
    add_column :b_passives, :effect_value, :string
  end
end
