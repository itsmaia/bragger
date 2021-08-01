class LanguageProject < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :immersion_subentries, through: :entries
  has_many :anki_subentries, through: :entries
  has_many :reading_subentries, through: :entries
end
