FactoryGirl.define do
  factory :user, :class => 'User' do
    sequence(:username) { |n| "foo#{n}" }
    password "foobar12"
    sequence(:email) { |n| "#{username}@example.com"}
  end

  factory :category, :class => 'Category' do
    name "miscellaneous"
  end

  factory :quiz, :class => 'Quiz' do
    sequence(:name) { |n| "quiz#{n}" }
    sequence(:description) { |n| "description#{n}" }
    category
    user
    time_limit "5"
  end

  factory :answer, :class => 'Answer' do
    sequence(:hint) { |n| "hint#{n}" }
    sequence(:solution) { |n| "solution#{n}" }
    quiz
  end

  factory :game, :class => 'Game' do
    quiz
    user
    correct_ans 0
  end
end