class ReadingSubentriesController < ApplicationController
  before_action :chronify, only: %i[update create]

  def new
    @reading_subentry = ReadingSubentry.new
  end

  def create
    @reading_subentry = ReadingSubentry.new(reading_subentry_params)
    @reading_subentry.entry_date = Entry.find(reading_subentry_params[:entry_id]).entry_date
    if @reading_subentry.save
      flash[:success] = "Reading data added!"
      render :index
    else
      render "new"
    end
  end

  def update
    @reading_subentry = ReadingSubentry.find(params[:id])
    @reading_subentry.update!(reading_subentry_params)
    render :index
  end

  def index
    @reading_subentries = current_user.reading_subentries.includes(:entry)
  end

  def edit
    @reading_subentry = ReadingSubentry.find(params[:id])
  end

  private

  def reading_subentry_params
    params.require(:reading_subentry).permit(:description, :duration, :entry_id)
  end

  def chronify
    params[:reading_subentry][:duration] = ChronicDuration.parse(reading_subentry_params[:duration])
  end
end
