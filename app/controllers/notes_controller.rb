class NotesController < ApplicationController
  before_action :set_notable, only: [ :create ]
  before_action :set_note, only: [ :edit, :update, :show ]

  def show; end


  def create
    @note = @notable.notes.build(note_params)

    @note.user ||= Current.user if @note.note_type == "comment"

    if @note.save
      redirect_back fallback_location: root_path, notice: "Note added."
    else
      redirect_back fallback_location: root_path, alert: "Unable to add note."
    end
  end


  def edit
    respond_to do |format|
      format.html { render :edit }
    end
  end

  def update
    if @note.update(note_params)
      respond_to do |format|
        format.html { redirect_to @note }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_notable
    klass = params[:notable_type].constantize
    @notable = klass.find(params[:notable_id])
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content)
    params.require(:note).permit(:content, :note_type, :icon)
  end
end
