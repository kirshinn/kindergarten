module Schedule
  class Group < ApplicationRecord
    has_many :schedule_entries, dependent: :destroy
    validates :name, :code, presence: true
    validates :code, uniqueness: true
  end
end
