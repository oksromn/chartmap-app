class Point < ApplicationRecord
  belongs_to :chart

  validates :value, presence: true
  validates :date, presence: true
end
