class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
