class AddEntryDateToImmersionSubentry < ActiveRecord::Migration[6.1]
  def change
    add_column :immersion_subentries, :entry_date, :datetime
  end
end
