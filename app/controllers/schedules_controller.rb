class SchedulesController < ApplicationController
  include Schedule
  allow_unauthenticated_access # Разрешить доступ к публичным методам без аутентификации
  def show
    @group = Schedule::Group.find_by!(code: params[:group_code])
    @schedule_entries = @group.schedule_entries.includes(:activity).order(:starts_at)

    respond_to do |format|
      format.html # рендерит app/views/schedules/show.html.erb
      format.json do
        render json: {
          group: { name: @group.name, code: @group.code },
          schedule_entries: @schedule_entries.map do |entry|
            {
              day: entry.day,
              starts_at: entry.starts_at,
              ends_at: entry.ends_at,
              activity: { name: entry.activity.name, code: entry.activity.code, color: entry.activity.color }
            }
          end,
          day_translations: Schedule::ScheduleEntry::DAY_TRANSLATIONS
        }
      end
    end
  end
end
