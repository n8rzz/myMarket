class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.integer :shares
      t.decimal :entryprice, :exitprice, :precision => 12, :scale => 4
      t.decimal :entryfee, :exitfee, :precision => 6, :scale => 2
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :stocks, [:user_id, :ticker, :created_at]
  end
end
