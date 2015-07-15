class GamesController < ApplicationController

  # def new
  #   quiz = Quiz.find params[:quiz_id]
  #   @game = Game.new
  # end

  def create
    @quiz = Quiz.find params[:quiz_id]
    @game = @quiz.games.create(game_params)
    @game.save!

    respond_to do |format|
      format.html { redirect_to quiz_path(@quiz), notice: 'Game started.' }
      format.js {}
      # format.json { render :show, status: :ok, location: @game }
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_game
  #   @game = Game.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.require(:game).permit(:quiz_id, :correct_ans, :game)
  end
end
