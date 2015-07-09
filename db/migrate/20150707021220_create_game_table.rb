class CreateGameTable < ActiveRecord::Migration
  def change
    create_table :game do |t|
      t.integer :quiz_id
      t.string :correct_answers
      t.string :total_answers
      t.timestamps null: false
    end
  end
end