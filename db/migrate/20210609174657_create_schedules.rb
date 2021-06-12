class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date       :date
      t.string     :detail
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end