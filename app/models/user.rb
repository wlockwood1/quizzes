class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, on: :create

  has_many :games, dependent: :destroy
  has_many :quizzes, dependent: :destroy
end
