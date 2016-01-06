class NotesController < ApplicationController
  def index
    @notes = Note.order("created_at DESC").page(params[:page]).per(10)
  end
end

