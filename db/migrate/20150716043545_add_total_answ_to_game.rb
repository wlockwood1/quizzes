class AddTotalAnswToGame < ActiveRecord::Migration
  def change
    add_column :games, :total_ans, :integer
  end
end
