class Api::V2::NotesController < Api::V2::BaseController
  wrap_parameters format: [:json], include: [:notable_type, :notable_id, :content, :assets_attributes]
  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      render json: @note
    else
      puts @note.errors.each{|k,v| "#{k}: #{v}"}
      head :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/notes/1
  # PATCH/PUT /api/v2/notes/1.json
  def update
    @note = Note.find(params[:id])
    if @note.update(note_params.except(:assets_attributes))
      render json: @note, status: :ok, location: api_v2_note_url(@note)
    else
      puts @note.errors.to_json
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
        :content,
        assets_attributes: [
          :attachable_type,
          :attachable_id,
          :external_url
        ]
      )
    end
end
