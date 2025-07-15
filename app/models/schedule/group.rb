class Group < ApplicationRecord
  has_many :schedule_entries, dependent: :destroy
  validates :name, presence: true
end
