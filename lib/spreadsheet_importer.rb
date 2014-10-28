class SpreadsheetImporter
  def self.import(filename, user)
    CSV.foreach("#{Rails.root.to_s}/public/spreadsheets/#{filename}", headers: true) do |row|
      next if row["First Name"].nil? || row["First Name"] == "Sample"

      first = row["First Name"].titlecase rescue nil
      last = row["Last Name"].titlecase rescue nil
      email = row["Email Address"].downcase rescue nil
      phone = row["Phone"]
      sex = row["Sex"].downcase rescue nil
      grade = row["Grade"].to_i rescue nil
      minutes = row["Minutes Spent in 1:1 Conversation (these can be estimates!)"]
      gpa = row["GPA"].to_f rescue nil
      media_consent = row["Media Consent Form"] =~ (/yes|true/i) ? true : false
      notes = "#{row["Notes on student"]} Passions: #{row["Passions"]}"
      passions = row["Passions"]

      person = Person.where(first_name: first, last_name: last).first_or_create do |p|
        p.update_attributes(
          first_name: first, last_name: last, email: email, phone: phone, sex: sex,
          grade: grade, gpa: gpa, media_consent: media_consent, notes: notes,
          school_id: user.school_id, passions: passions
        )
      end
      engagement = Engagement.create(
        duration: minutes.to_f,
        notes: "Imported from spreadsheet",
        kind: "Coaching Session",
        date: Date.parse("2014-10-01"),
        school_id: user.school_id,
        attendee_ids: [person.id]
      )
    end
  end
end

