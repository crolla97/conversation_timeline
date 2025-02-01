class NotesController < ApplicationController
  before_action :set_notable

  def create
    @note = @notable.notes.build(note_params)

    @note.user ||= Current.user if @note.note_type == "comment"

    if @note.save
      redirect_back fallback_location: root_path, notice: "Note added."
    else
      redirect_back fallback_location: root_path, alert: "Unable to add note."
    end
  end

  private

  def set_notable
    klass = params[:notable_type].constantize
    @notable = klass.find(params[:notable_id])
  end

  def note_params
    params.require(:note).permit(:content, :note_type)
  end
end
