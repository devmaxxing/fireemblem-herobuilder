class HomeController < ApplicationController
    def index
        @heroes = Hero.select(:id, :name)
        gon.heroes = @heroes
    end
end