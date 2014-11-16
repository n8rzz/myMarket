class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :ticker
      t.integer :shares
      t.decimal :entryprice, :precision => 12, :scale => 4
      t.decimal :fee, :precision => 6, :scale => 2
      t.references :user, index: true

      t.timestamps null: false
    end
      add_index :transactions, [:user_id, :created_at]
  end
end
