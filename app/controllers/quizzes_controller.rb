class QuizzesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    if params[:search]
      @quizzes = Quiz.search(params[:search])
    else
      @quizzes = Quiz.all
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @quiz = Quiz.find(params[:id])
    @answers = @quiz.answers.all
    @games = @quiz.games.order('correct_ans DESC').limit(5)
    render 'show'
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
    @categories = Category.all
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
    @categories = Category.all
    @answers = @quiz.answers.all
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    @categories = Category.all

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to edit_quiz_path(@quiz) }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to edit_quiz_path(@quiz) }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    flash[:notice] = "Quiz deleted."
    redirect_to '/'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params[:quiz].permit!
    end
end
