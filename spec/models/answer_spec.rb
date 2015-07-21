require 'rails_helper'

RSpec.describe Answer, type: :model do
  before :each do
    @answer = FactoryGirl.create(:answer)
  end

  context 'create answer' do
    it 'belongs to a quiz' do
      expect(@answer.quiz).to_not eq nil
    end

    it 'is invalid without a solution' do
      @answer.solution = nil
      expect {@answer.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Solution can't be blank")
    end
  end

end
