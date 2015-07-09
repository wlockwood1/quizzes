class Answer < ActiveRecord::Base
  belongs_to :quiz

  def self.search(solution)
    if solution
      solution.downcase!
      where('LOWER(solution) like ?', "%#{solution}%")
    else
      all
    end
  end

end

