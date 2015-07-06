class AddTimeLimitToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :time_limit, :decimal
  end
end
