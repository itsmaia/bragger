class Entry < ApplicationRecord
  require "chronic_duration"

  attribute :anki, :interval
  attribute :reading, :interval
  attribute :listening, :interval
  attribute :passive_listening, :interval

  validates :entry_date,
            :anki,
            presence: true

  belongs_to :user
end
