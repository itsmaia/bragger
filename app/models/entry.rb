class Entry < ApplicationRecord
  require "chronic_duration"

  validates :entry_date,
            presence: true

  has_many :anki_subentries
  has_many :reading_subentries
  has_many :immersion_subentries
  belongs_to :user
  belongs_to :language_project
end
