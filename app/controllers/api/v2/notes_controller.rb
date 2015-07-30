class Api::V2::NotesController < Api::V2::BaseController

  def create
    @notes = current_user.notes.new(notes_params)
    @notes.caption = params[:filename] if (params[:filename] && @notes.caption.blank?)
    if @notes.save
      render json: @notes
    else
      head :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/notes/1
  # PATCH/PUT /api/v2/notes/1.json
  def update
    if @note.update(note_params)
      render :show, status: :ok, location: api_v2_note_url(@note)
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
    def notes_params
      params.require(:note).permit(
        :notable_type,
        :notable_id,
        :user_id,
        :content
      )
    end
end
