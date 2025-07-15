# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

groups = %w[Ясли Младшая Средняя Старшая Подготовительная]
activities = {
  'Завтрак'      => '#FFB74D',
  'Музыка'       => '#64B5F6',
  'Прогулка'     => '#81C784',
  'Обед'         => '#FF8A65',
  'Тихий час'    => '#BA68C8',
  'Развитие речи'=> '#4DB6AC'
}

groups.each { |g| Schedule::Group.create!(name: g) }
activities.each { |name, color| Schedule::Activity.create!(name:, color:) }

Schedule::Group.all.each do |group|
  %w[monday tuesday wednesday thursday friday].each do |day|
    time = Time.zone.parse('08:30')
    Schedule::Activity.all.shuffle.each do |act|
      Schedule::ScheduleEntry.create!(
        group: group,
        activity: act,
        day: day,
        starts_at: time,
        ends_at: time += 1.hour
      )
    end
  end
end
