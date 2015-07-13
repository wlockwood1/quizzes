class GamesController < ApplicationController

  # def new
  #   @quiz = Quiz.find params[:quiz_id]
  #   @game = Game.new
  # end

  def create
    @quiz = Quiz.find params[:quiz_id]
    @game = @quiz.game.create
    @game.save
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params[:game].permit!
  end
end
