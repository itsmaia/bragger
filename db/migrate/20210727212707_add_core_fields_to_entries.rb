class AddCoreFieldsToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :anki, :interval
    add_column :entries, :reading, :interval
    add_column :entries, :listening, :interval
    add_column :entries, :passive_listening, :interval
    add_column :entries, :sentences_added, :integer
    add_column :entries, :words_added, :integer
    add_column :entries, :commentary, :text
    add_column :entries, :entry_date, :datetime
    add_reference :entries, :user, index: true
  end
end
