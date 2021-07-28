class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    chronify(@entry)
    @entry&.user_id = current_user.id
    if @entry.save
      flash[:success] = "entry created!"
      render action: "index"
    else
      render "new"
    end
  end

  def index
    @entries = Entry.all
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:entry_date, :anki, :reading, :listening, :passive_listening, :sentences_added, :words_added, :commentary)
  end

  def chronify(entry)
    entry.anki = ChronicDuration.parse(entry_params[:anki])
    entry.reading = ChronicDuration.parse(entry_params[:reading])
    entry.listening = ChronicDuration.parse(entry_params[:listening])
    entry.passive_listening = ChronicDuration.parse(entry_params[:passive_listening])
    entry
  end
end
