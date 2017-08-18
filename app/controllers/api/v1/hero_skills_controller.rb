module Api
    module V1
        class HeroSkillsController < ApiController
            private
                def hero_skill_params
                    params.require(:hero_skill).permit(:hero_id, :skill_id, :rarity)
                end
        end
    end
end