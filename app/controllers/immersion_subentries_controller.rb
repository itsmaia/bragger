class ImmersionSubentriesController < ApplicationController
  before_action :chronify, only: %i[update create]

  def new
    @immersion_subentry = ImmersionSubentry.new
  end

  def create
    @immersion_subentry = ImmersionSubentry.new(immersion_subentry_params)
    if @immersion_subentry.save
      flash[:success] = "Immersion data added!"
      render action: "index"
    else
      render "new"
    end
  end

  def update
    @immersion_subentry = ImmersionSubentry.find(params[:id])
    @immersion_subentry.update!(immersion_subentry_params)
    render action: "index"
  end

  def index
    @immersion_subentries = ImmersionSubentry.all # Needs to be updated
  end

  def edit
    @immersion_subentry = ImmersionSubentry.find(params[:id])
  end

  private

  def immersion_subentry_params
    params.require(:immersion_subentry).permit(:description, :immersion_type, :duration, :entry_id)
  end

  def chronify
    params[:immersion_subentry][:duration] = ChronicDuration.parse(immersion_subentry_params[:duration])
  end
end
