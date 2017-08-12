class RemoveRequiredSkillIdFromSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :required_skill_id
  end
end
