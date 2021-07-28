class RemoveEntryOldFields < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :anki, :interval
    remove_column :entries, :reading, :interval
    remove_column :entries, :listening, :interval
    remove_column :entries, :passive_listening, :interval
  end
end
