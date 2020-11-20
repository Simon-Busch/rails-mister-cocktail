class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  def rating
    # raise
    if self.reviews.length == 0
      return "⭐️⭐️⭐️"
    else 
      count = 0;
      self.reviews.each do |review|
      count += review.rating
      end
      average = (count / self.reviews.length).floor
      return "⭐️"*average
    end
  end
end
