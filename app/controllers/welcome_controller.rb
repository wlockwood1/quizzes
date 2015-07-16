class WelcomeController < ApplicationController
  def index
    @quiz = Quiz.all.shuffle
    # if current_user
  #   @user = current_user
  #    @games = @user.games.order('created_at DESC').limit(5);
  end
end
