class CreateScheduleEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :schedule_entries do |t|
      t.references :group, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.string :day, null: false
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
