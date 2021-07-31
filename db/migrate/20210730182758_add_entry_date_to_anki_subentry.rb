class AddEntryDateToAnkiSubentry < ActiveRecord::Migration[6.1]
  def change
    add_column :anki_subentries, :entry_date, :datetime
  end
end
