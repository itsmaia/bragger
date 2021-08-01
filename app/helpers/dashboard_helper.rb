module DashboardHelper
  SUBENTRIES = %w[AnkiSubentry ReadingSubentry ImmersionSubentry].freeze
  COLORS = { "AnkiSubentry": "#e6ee9c", "ReadingSubentry": "#f48fb1", "ActiveImmersion": "#9fa8da", "PassiveImmersion": "#ff8a65" }.freeze
  def activity_distribution_data(language_project)
    total_hours = total_hours(language_project)
    activity_distribution(language_project, total_hours)
  end

  private

  def activity_distribution(language_project, total_hours)
    activity_distribution_data = []

    SUBENTRIES.each do |clazz|
      if clazz == "ImmersionSubentry"
        active_immersion_total_hours = language_project.send(clazz.underscore.pluralize).active.sum(:duration)
        active_immersion_percentage = (active_immersion_total_hours.to_f / total_hours * 100).round if active_immersion_total_hours > 0

        activity_distribution_data << {
          type: "Active Immersion",
          total_hours: active_immersion_total_hours,
          percentage: active_immersion_percentage,
          color: COLORS[:ActiveImmersion]
        }

        passive_immersion_total_hours = language_project.send(clazz.underscore.pluralize).passive.sum(:duration)
        passive_immersion_percentage = (passive_immersion_total_hours.to_f / total_hours * 100).round if passive_immersion_total_hours > 0

        activity_distribution_data << {
          type: "Passive Immersion",
          total_hours: passive_immersion_total_hours,
          percentage: passive_immersion_percentage,
          color: COLORS[:PassiveImmersion]
        }
      else
        clazz_total_hours = language_project.send(clazz.underscore.pluralize).sum(:duration)
        clazz_percentage = (clazz_total_hours.to_f / total_hours * 100).round if clazz_total_hours > 0

        activity_distribution_data << {
          type: clazz.gsub("Subentry", ""),
          total_hours: clazz_total_hours,
          percentage: clazz_percentage,
          color: COLORS[clazz.to_sym]
        }
      end
    end

    activity_distribution_data.sort_by { |k| k[:percentage] || 0 }.reverse
  end

  def total_hours(language_project)
    total_hours = 0
    SUBENTRIES.each do |clazz|
      total_hours += language_project.send(clazz.underscore.pluralize).sum(:duration)
    end

    total_hours
  end
end
