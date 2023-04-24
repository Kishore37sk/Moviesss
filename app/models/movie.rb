class Movie < ApplicationRecord
  has_many :reviews,dependent: :destroy

  scope :ordered_by_rating, -> {
    joins(:reviews)
      .select('movies.*, AVG(reviews.rating) AS avg_rating')
      .group('movies.id')
      .order('avg_rating DESC')
  }


  scope :released_on, ->(date) { where(release_date: date.to_date) if date.present? }

  def avg_rating
    reviews.average(:rating).to_f.round(1) if reviews.any?
  end
end

