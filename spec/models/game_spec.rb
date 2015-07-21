require 'rails_helper'

RSpec.describe Game, type: :model do
  before :each do
    @game = FactoryGirl.create(:game)
  end

  context 'create game' do
    it 'has a quiz_id' do
      expect(@game.quiz).to_not eq nil
    end

    it 'has a user_id' do
      expect(@game.user).to_not eq nil
    end

    it 'starts with 0 correct answers' do
      expect(@game.correct_ans).to eq 0
    end

  end

  # describe ".increase_correct_ans" do
  #
  #   context "given 0 correct answers in guess" do
  #   end
  #   context "given 1 correct answers in guess" do
  #
  #   end
  #   context "given 2 correct answers in guess" do
  #
  #   end
  # end
end