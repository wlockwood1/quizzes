class Quiz < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :games, dependent: :destroy

  def self.search(name)
    if name
      name.downcase!
      where('LOWER(name) LIKE ?', "%#{name}%")
    else
      all
    end
  end

end
