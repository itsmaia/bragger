class Entry < ApplicationRecord
  require "chronic_duration"

  validates :entry_date,
            presence: true

  has_many :anki_subentries, dependent: :destroy
  has_many :reading_subentries, dependent: :destroy
  has_many :immersion_subentries, dependent: :destroy
  belongs_to :user
  belongs_to :language_project
end
