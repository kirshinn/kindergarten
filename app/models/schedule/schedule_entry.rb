module Schedule
  class ScheduleEntry < ApplicationRecord
    belongs_to :group
    belongs_to :activity

    validates :starts_at, :ends_at, presence: true
    validate  :times_do_not_overlap

    def self.days
      %w[monday tuesday wednesday thursday friday]
    end

    # Маппинг английских дней на русские дни недели через I18n
    DAY_TRANSLATIONS = Hash[self.days.zip(I18n.t("date.day_names")[0..4])]

    private

    def times_do_not_overlap
      overlap = group.schedule_entries
                     .where(day: day)
                     .where.not(id: id)
                     .where("tsrange(starts_at, ends_at) && tsrange(?,?)",
                            starts_at, ends_at)
      errors.add(:base, "Перекрытие во времени") if overlap.exists?
    end
  end
end
