class AddEntryDateToReadingSubentry < ActiveRecord::Migration[6.1]
  def change
    add_column :reading_subentries, :entry_date, :datetime
  end
end
