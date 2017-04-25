class RenameSkillInheritRulesColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :skills, :inherit_rules, :inherit_rule
  end
end
