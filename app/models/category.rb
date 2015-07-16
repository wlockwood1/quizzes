class Category < ActiveRecord::Base
  has_many :quizzes
  has_many :games
end
