class Category < ActiveRecord::Base
  has_many :quizzes
  has_many :games
  validates_presence_of :name
end
