class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.integer :ticket_id
      t.integer :amount

      t.timestamps
    end
  end
end
