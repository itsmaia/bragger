class EntryStats
  def initialize(language_project)
    @language_project = language_project
  end

  def percentage_for_subject
    (hours_for_subject.to_f / total_hours * 100).round
  end

  def hours_for_subject
    hour_entries_for_subject.sum(:value)
  end

  def total_hours
    anki = @language_project&.anki_subentries&.sum(:duration)
    reading = @language_project&.reading_subentries&.sum(:duration)
    immersion = @language_project&.immersion_subentries&.sum(:duration)
    anki + reading + immersion
  end

  def hours_for_subject_collection(collection)
    collection.map do |subject|
      @subject = subject
      {
        value: hours_for_subject,
        color: subject.label.pastel_color,
        label: subject.label,
        highlight: "gray"
      }
    end
  end

  private

  def hour_entries_for_subject
    if @subject.instance_of?(RemainingCategory)
      @entries.where("category_id in (?)", @subject.ids)
    else
      @entries.where("#{@subject.class.name.downcase}_id = (?)", @subject.id)
    end
  end
end
