class GamesController < ApplicationController
  def index
  	@games = Game.page(params[:page].to_i)
  end

  def show
  end
end
