class CreateImmersionSubentries < ActiveRecord::Migration[6.1]
  def change
    create_table :immersion_subentries do |t|
      t.string :description
      t.integer :immersion_type
      t.datetime :start_time
      t.datetime :stop_time
      t.integer :duration

      t.timestamps
    end

    add_reference :immersion_subentries, :entry, index: true
  end
end
