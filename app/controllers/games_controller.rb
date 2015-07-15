class GamesController < ApplicationController

  # def new
  #   quiz = Quiz.find params[:quiz_id]
  #   @game = Game.new
  # end

  def create
    @quiz = Quiz.find params[:quiz_id]
    @game = @quiz.game.create
    @game.save!
    format.html { redirect_to @quiz }
    format.js {}
    # format.json { render :show, status: :ok, location: @game }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params[:game].permit(:quiz_id, :corr_ans)
  end
end
