class StatsPresenter
  NUMBER_OF_ACTIVITIES = 4

  def show_activity_distribution_bar
    template.render partial: "dashboard/activity_distribution_bar",
                    as: :activity_distribution,
                    collection: 4
  end
end
