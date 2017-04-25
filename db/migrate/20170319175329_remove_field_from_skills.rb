class RemoveFieldFromSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :weapon_type, :string
    remove_column :skills, :cooldown, :integer
  end
end
