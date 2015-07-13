class DropGame < ActiveRecord::Migration
  def change
    drop_table :game
  end
end
