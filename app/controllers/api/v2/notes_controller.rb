class Api::V2::NotesController < Api::V2::BaseController

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      render json: @note
    else
      head :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/notes/1
  # PATCH/PUT /api/v2/notes/1.json
  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      render json: @note, status: :ok, location: api_v2_note_url(@note)
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @notes = Note.find params[:id]
    @notes.destroy
    head :no_content
  end


  private
    def note_params
      params.require(:note).permit(
        :notable_type,
        :notable_id,
        :content
      )
    end
end
