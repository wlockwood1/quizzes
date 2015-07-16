class WelcomeController < ApplicationController
  def index
    @quiz = Quiz.all.shuffle
  end
end
