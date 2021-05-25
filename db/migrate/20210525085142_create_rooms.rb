class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string    :title,     null: false
      t.string    :overview,  null: false
      t.text      :details
      t.integer   :budget
      t.integer   :capacity,  null: false
      t.integer   :category,  null: false
      t.integer   :leader,    null: false
      t.timestamps
    end
  end
end
