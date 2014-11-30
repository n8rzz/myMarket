class AddEntryExitDateToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :entrydate, :datetime
    add_column :stocks, :exitdate, :datetime
  end
end
