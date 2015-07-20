class Answer < ActiveRecord::Base
  belongs_to :quiz
  validates_presence_of :solution
end

