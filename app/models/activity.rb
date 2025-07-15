class Activity < ApplicationRecord
  has_many :schedule_entries, dependent: :nullify
  validates :name, presence: true
  validates :color, format: /\A#[0-9a-fA-F]{6}\z/
end
