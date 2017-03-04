class GamesController < ApplicationController
  def index
  	@current_games = Game.where(state: Game::CURRENT).all
  	@finished_games = Game.where(state: Game::FINISHED).all
  	@aborted_games = Game.where(state: Game::ABORTED).all
  end
end
