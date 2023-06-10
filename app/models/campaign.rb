class Campaign < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :goal, presence: true, numericality: { greater_than: 0 }

  broadcasts_to ->(_) { 'campaigns' }, inserts_by: :prepend

  scope :recent, -> { order(created_at: :desc) }
end
