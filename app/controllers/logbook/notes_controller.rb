class Logbook::NotesController < Logbook::ApplicationController
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to url_for([:logbook, @note.notable]), notice: 'note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
        format.js
      else
        format.html { redirect_to request.referrer, notice: 'note was not saved.' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
        format.js { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Note destroyed' }
        format.js
      end
    end
  end

  private
    def attachable_params
      params.slice(:attachable_id, :attachable_type)
    end

    def note_params
      params.require(:note).permit!
    end

end
