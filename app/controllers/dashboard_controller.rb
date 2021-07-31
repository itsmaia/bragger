class DashboardController < ApplicationController
  def index
    @language_project = current_user.language_projects.first
  end
end
