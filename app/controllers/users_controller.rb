class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @games = @user.games.all
    @quizzes = @user.quizzes.all
  end

end
