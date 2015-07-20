class Game < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user

  def increase_correct_ans
    self.correct_ans += 1
    self.save
  end
end
