class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :ticker, :side, :optiontype, :expiration
      t.integer :contracts, :size
      t.decimal :strike, :entryfee, :exitfee, :precision => 6, :scale => 2
      t.decimal :entryprice, :exitprice, :precision => 12, :scale => 4
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :options, [:user_id, :ticker, :created_at]
  end
end
