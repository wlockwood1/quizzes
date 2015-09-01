  class AnswersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @quiz = Quiz.find(params[:id])
    @answers = @quiz.answers.all
  end

  # GET /answers/new
  def new
    quiz = Quiz.find(params[:quiz_id])
    @answer = quiz.answers.new
    @answers = quiz.answers.all
  end

  # GET /answers/1/edit
  def edit
    quiz = Quiz.find(params[:quiz_id])
    @answer = Answer.find(params[:id])
    @answers = quiz.answers.all
  end

  def create
    # quiz = Quiz.find(params[:quiz_id])
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    head :no_content
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:quiz_id, :hint, :solution)
  end
end
