class Quiz < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :answers
  has_many :games
end
