namespace :assets do
  desc "Gathers assets attached directly to engagements, makes them notes"
  task transform: :environment do
    Asset.where(attachable_type: "Engagement").each do |a|
      already_imported_notes = a.attachable.notes.joins(:assets).where(
        assets: { data_file_name: a.data_file_name }
      )
      a.make_a_note
      if already_imported_notes.any?
        already_imported_notes.destroy_all
      end
    end
  end
end

