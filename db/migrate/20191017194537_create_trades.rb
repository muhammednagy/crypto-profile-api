class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :currency, null: false
      t.decimal :amount, precision: 16, scale: 8, null: false  # the smallest unit of bitcoin is satoshi and it equals 0.00000001 BTC
      t.datetime :date_of_purchase
      t.string :note, null: false

      t.timestamps
    end
  end
end
