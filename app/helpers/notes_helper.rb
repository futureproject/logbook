module NotesHelper
  def verbiage_for(note)
    case note.kind
    when "photo" then "uploaded a photo."
    when "text" then "added a note."
    else "added a note."
    end
  end
end
