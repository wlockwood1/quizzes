require 'rails_helper'

RSpec.describe Quiz, type: :model do
  before :each do
    @quiz = create(:quiz)
  end

  context 'create quiz' do
    it 'is invalid without a name' do
      @quiz.name = nil
      expect {@quiz.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end

    it 'is invalid without a category' do
      @quiz.category = nil
      expect {@quiz.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Category can't be blank")
    end

    context 'invalid time limit' do
      it 'is invalid without a time limit' do
        @quiz.time_limit = nil
        expect {@quiz.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Time limit can't be blank, Time limit is not a number")
      end

      it 'is invalid if the time limit is not a number' do
        @quiz.time_limit = 'cheese'
        expect {@quiz.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Time limit is not a number")
      end

      it 'is invalid if the time limit is a number less than 0' do
        @quiz.time_limit = -1
        expect {@quiz.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Time limit must be greater than 0")
      end

    end

    it 'belongs to a user' do
      expect(@quiz.user).to_not eq nil
    end

    it 'has 0 answers when created' do
      expect(@quiz.answers.count).to eq 0
    end

    it 'has 0 plays when created' do
      expect(@quiz.games_count).to eq 0
    end

  end
end
