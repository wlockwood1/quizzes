class WelcomeController < ApplicationController
  def index
    @quiz = Quiz.all.shuffle
    @quizzes = Quiz.all.order('games_count desc').limit(10)
    if current_user
      @user = current_user
      @games = @user.games.order('created_at DESC').limit(5)
    end
  end
end
