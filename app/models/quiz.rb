class Quiz < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :games, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :category_id
  validates_presence_of :time_limit


  def self.search(name)
    if name
      name.downcase!
      where('LOWER(name) LIKE ?', "%#{name}%")
    else
      all
    end
  end

  def play_count
    self.games.count
  end

end
