require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FeharenaBuilds
  INHERIT_RULES_NORMAL = "normal"
  
  INHERIT_RULES_NOT_INHERITABLE = "not_inheritable"
  
  INHERIT_RULES_DANCER_ONLY = "dancer_only"

  INHERIT_RULES_COLOR_ONLY = "color_only"
  INHERIT_RULES_NO_BLUE = "no_blue"
  INHERIT_RULES_NO_RED = "no_red"
  INHERIT_RULES_NO_GREEN = "no_green"
  
  INHERIT_RULES_MELEE_ONLY = "melee_only"
  INHERIT_RULES_RANGED_ONLY = "ranged_only"
  
  INHERIT_RULES_ARMOUR_ONLY = "armour_only"
  INHERIT_RULES_CAVALRY_ONLY = "cavalry_only"
  INHERIT_RULES_FLIER_ONLY = "flier_only"
  
  INHERIT_RULES_STAFF_ONLY = "staff_only"
  INHERIT_RULES_AXE_ONLY = "axe_only"
  INHERIT_RULES_BOW_ONLY = "bow_only"
  INHERIT_RULES_DRAGON_ONLY = "dragon_only"
  
  INHERIT_RULES_NO_STAFF = "no_staff"
  
  INHERIT_RULES_NO_FLIERS = "no_fliers"
  
  COLOR_RED = "red"
  COLOR_BLUE = "blue"
  COLOR_GREEN = "green"
  COLOR_NO_COLOR = "no_color"
  
  WEAPON_TYPE_SWORD = "sword"
  WEAPON_TYPE_LANCE = "lance"
  WEAPON_TYPE_AXE = "axe"
  WEAPON_TYPE_DAGGER = "dagger"
  WEAPON_TYPE_BOW = "bow"
  WEAPON_TYPE_TOME = "tome"
  WEAPON_TYPE_STAFF = "staff"
  WEAPON_TYPE_DRAGON = "dragon"
  
  MOVE_TYPE_INFANTRY = "infantry"
  MOVE_TYPE_ARMOUR = "armour"
  MOVE_TYPE_CAVALRY = "cavalry"
  MOVE_TYPE_FLIER = "flier"
  
  
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
