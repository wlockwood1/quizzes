class AddGamesCount < ActiveRecord::Migration
  def change
    add_column :quizzes, :games_count, :integer, :default => 0
  end
end
