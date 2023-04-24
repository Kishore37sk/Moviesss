require 'rails_helper'

RSpec.describe Movie, type: :model do


  describe 'associations' do
    it { should have_many(:reviews).dependent(:destroy) }
  end
  describe '#avg_rating' do
    it 'calculates the average rating for a movie' do
      movie = create(:movie)
      create(:review, movie: movie, rating: 4)
      create(:review, movie: movie, rating: 5)
      expect(movie.avg_rating).to eq 4.5
    end
    it 'returns nil if there are no reviews' do
      movie = create(:movie)
      expect(movie.avg_rating).to be_nil
    end
  end
end
