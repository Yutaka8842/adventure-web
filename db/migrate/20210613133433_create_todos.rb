class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string     :text
      t.references :room, foreign_key: true
      t.references :schedule, foreign_key: true
      t.timestamps
    end
  end
end
