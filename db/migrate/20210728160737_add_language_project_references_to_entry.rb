class AddLanguageProjectReferencesToEntry < ActiveRecord::Migration[6.1]
  def change
    add_reference :entries, :language_project, index: true
  end
end
