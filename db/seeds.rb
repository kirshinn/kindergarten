# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
groups = %w[Ясли Младшая Средняя Старшая Подготовительная]
activities = {
  'Завтрак'      => '#FFB74D',
  'Музыка'       => '#64B5F6',
  'Прогулка'     => '#81C784',
  'Обед'         => '#FF8A65',
  'Тихий час'    => '#BA68C8',
  'Развитие речи'=> '#4DB6AC'
}

groups.each { |g| Group.create!(name: g) }
activities.each { |name, color| Activity.create!(name:, color:) }

Group.all.each do |group|
  %w[mon tue wed thu fri].each do |day|
    time = Time.zone.parse('08:30')
    Activity.all.shuffle.each do |act|
      ScheduleEntry.create!(
        group: group,
        activity: act,
        day: day,
        starts_at: time,
        ends_at: time += 1.hour
      )
    end
  end
end
