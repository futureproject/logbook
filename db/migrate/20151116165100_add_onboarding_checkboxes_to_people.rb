class AddOnboardingCheckboxesToPeople < ActiveRecord::Migration
  def change
    add_column :people, :future_fellow, :boolean, default: false
    add_column :people, :ob_media_release, :boolean, default: false
    add_column :people, :ob_parental_consent, :boolean, default: false
    add_column :people, :ob_disclaimer, :boolean, default: false
    add_column :people, :birthday, :date
    remove_column :people, :media_release
  end
end
