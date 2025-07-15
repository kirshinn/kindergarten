class AddDayOfWeekEnum < ActiveRecord::Migration[8.0]
  def up
    execute "CREATE TYPE day AS ENUM ('mon','tue','wed','thu','fri');"
  end
  def down
    execute "DROP TYPE day;"
  end
end
