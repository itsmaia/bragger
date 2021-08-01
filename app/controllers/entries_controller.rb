class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry&.user_id = current_user.id
    if @entry.save
      flash[:success] = "entry created!"
      render action: "index"
    else
      render "new"
    end
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update!(entry_params)
    render action: "index"
  end

  def index
    @entries = current_user.entries.includes(:language_project)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:entry_date, :sentences_added, :words_added, :commentary, :language_project_id)
  end
end
