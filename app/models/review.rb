class Review < ApplicationRecord
  belongs_to :movie,counter_cache: true
  belongs_to :user
end
