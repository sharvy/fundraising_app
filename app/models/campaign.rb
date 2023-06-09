class Campaign < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :goal, presence: true, numericality: { greater_than: 0 }
end
