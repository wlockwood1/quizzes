class Game < ActiveRecord::Base
  belongs_to :quiz, :counter_cache => true
  belongs_to :user

  def increase_correct_ans
    self.correct_ans += 1
    self.save
  end
end
