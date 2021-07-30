class AnkiSubentriesController < ApplicationController
  before_action :chronify, only: %i[update create]

  def new
    @anki_subentry = AnkiSubentry.new
  end

  def create
    @anki_subentry = AnkiSubentry.new(anki_subentry_params)
    if @anki_subentry.save
      flash[:success] = "Anki data added!"
      render :index
    else
      render "new"
    end
  end

  def update
    @anki_subentry = AnkiSubentry.find(params[:id])
    @anki_subentry.update!(anki_subentry_params)
    render :index
  end

  def index
    @anki_subentries = AnkiSubentry.all # Needs to be updated
  end

  def edit
    @anki_subentry = AnkiSubentry.find(params[:id])
  end

  private

  def anki_subentry_params
    params.require(:anki_subentry).permit(:description, :duration, :entry_id)
  end

  def chronify
    params[:anki_subentry][:duration] = ChronicDuration.parse(anki_subentry_params[:duration])
  end
end
