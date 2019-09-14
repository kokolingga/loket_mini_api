class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :amount
      t.bigint :price
      t.string :description
      t.date :sale_start_date
      t.date :sale_end_date
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
