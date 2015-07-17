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

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to new_quiz_answer_path(@answer.quiz), notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to edit_quiz_path(@answer.quiz), notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to edit_quiz_path(@quiz), notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:quiz_id, :hint, :solution)
  end
end
