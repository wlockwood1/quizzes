class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :quiz_id
      t.string :hint
      t.string :solution
      t.timestamps null: false
    end
  end
end
