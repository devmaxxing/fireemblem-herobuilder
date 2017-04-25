class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :type
      t.string :name
      t.integer :required_skill_id
      t.text :description
      t.string :inherit_rules
      t.integer :sp_cost
      t.string :weapon_type
      t.integer :cooldown
    end
  end
end
