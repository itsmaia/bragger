class CreateReadingSubentries < ActiveRecord::Migration[6.1]
  def change
    create_table :reading_subentries do |t|
      t.string :description
      t.datetime :start_time
      t.datetime :stop_time
      t.integer :duration

      t.timestamps
    end

    add_reference :reading_subentries, :entry, index: true
  end
end
