class AddEntryExitDateToOptions < ActiveRecord::Migration
  def change
    add_column :options, :entrydate, :datetime
    add_column :options, :exitdate, :datetime
  end
end
