class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.string :type
      t.integer :capacity
      t.string :organizer
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.references :location, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
