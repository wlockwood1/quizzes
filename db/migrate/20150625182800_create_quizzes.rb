class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :category_id
      t.string :name
      t.timestamps null: false

      # t.int :hints_per_ans #Drop down for hints per answer when creating game
      # t.int :total_plays, :default => 0 #total_plays++ when :time_left => 0, or when :time_left /:time_limit =< 50% or other number
      #
      # #Create separate model for live game?
      # t.interval :time_limit #need to include field for minutes & seconds I think.
      # t.interval :time_left #Start countdown when start? => true
      # t.boolean :start?, :default => false #start? => true when button pressed
      # t.boolean :pause?, :default => false #Pause countdown when button pressed (:pause? => true)
      # t.boolean :give_up?, :default => false #:time_left => 0, Show answer.all when button pressed (:give_up? => true)
      # t.boolean :game_over?, :default => false #Becomes true when :time_left => 0
      # t.string :user_guess #Try to figure out way to check if :user_guess => :answer as typing. If not checks if :user_guess => :answer when button pressed, and resets input
      # t.integer :correct_answers :default => 0 #correct_answers++ when :user_guess => :answer
      # t.integer :total_answers #:total_answers => answer.count
    end
  end
end
