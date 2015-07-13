class AddCorrectAnswersToGame < ActiveRecord::Migration
  def change
    add_column :games, :quiz_id, :integer
    add_column :games, :correct_ans, :integer
  end
end
