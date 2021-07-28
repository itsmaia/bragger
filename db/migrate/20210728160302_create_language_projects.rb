class CreateLanguageProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :language_projects do |t|
      t.string :name
      t.boolean :active

      t.references :user_id, index: true
      t.timestamps
    end
  end
end
