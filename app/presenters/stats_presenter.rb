class StatsPresenter
  def show_activity_distribution_bar
    template.render partial: "dashboard/activity_distribution_bar",
                    as: :activity_distribution,
                    collection: categories_with_remainder,
                    collection: 4
  end
end
