class ScheduleEntry < ApplicationRecord
  belongs_to :group
  belongs_to :activity
  enum day: { mon: "mon", tue: "tue", wed: "wed",
              thu: "thu", fri: "fri" }, _suffix: true

  validates :starts_at, :ends_at, presence: true
  validate  :times_do_not_overlap

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
