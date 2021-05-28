class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string    :title,     null: false
      t.string    :overview,  null: false
      t.text      :details
      t.integer   :budget
      t.integer   :capacity
      t.integer   :category
      t.integer   :leader,    null: false
      t.timestamps
    end
  end
end
