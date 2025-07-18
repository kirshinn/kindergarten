# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

groups = [
  { name: 'Ясли', code: 'nursery' },
  { name: 'Младшая', code: 'junior' },
  { name: 'Средняя', code: 'middle' },
  { name: 'Старшая', code: 'senior' },
  { name: 'Подготовительная', code: 'preparatory' }
]

activities = [
  { name: 'Завтрак', code: 'breakfast', color: '#FFB74D' },
  { name: 'Музыка', code: 'music', color: '#64B5F6' },
  { name: 'Прогулка', code: 'walk', color: '#81C784' },
  { name: 'Обед', code: 'lunch', color: '#FF8A65' },
  { name: 'Тихий час', code: 'nap', color: '#BA68C8' },
  { name: 'Развитие речи', code: 'speech', color: '#4DB6AC' }
]

groups.each do |group|
  Schedule::Group.create!(name: group[:name], code: group[:code])
end

activities.each do |activity|
  Schedule::Activity.create!(name: activity[:name], code: activity[:code], color: activity[:color])
end

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
