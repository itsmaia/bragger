class LanguageProject < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :immersion_subentries, through: :entries
  has_many :anki_subentries, through: :entries
  has_many :reading_subentries, through: :entries

  def total_hours
    anki = anki_subentries&.sum(:duration)
    reading = reading_subentries&.sum(:duration)
    immersion = immersion_subentries&.sum(:duration)
    anki + reading + immersion
  end

  def activity_distribution_percentages
    anki = (anki_subentries&.sum(:duration).to_f / total_hours * 100).round if anki
    reading = (reading_subentries&.sum(:duration).to_f / total_hours * 100).round if reading
    passive_immersion = (immersion_subentries.passive&.sum(:duration).to_f / total_hours * 100).round if passive_immersion
    active_immersion = (immersion_subentries.active&.sum(:duration).to_f / total_hours * 100).round if active_immersion
    [ {
      type: "Anki",
      total_hours: anki_subentries&.sum(:duration),
      percentage: anki,
      color: "#e6ee9c"
    }, {
      type: "Reading",
      total_hours: reading_subentries&.sum(:duration),
      percentage: reading,
      color: "#f48fb1"
    }, {
      type: "Passive Immersion",
      total_hours: immersion_subentries.passive&.sum(:duration),
      percentage: passive_immersion,
      color: "#9fa8da"
    }, {
      type: "Active Immersion",
      total_hours: immersion_subentries.active&.sum(:duration),
      percentage: active_immersion,
      color: "#ff8a65"
    } ].sort_by {|k| k[:percentage]}.reverse
  end
end
