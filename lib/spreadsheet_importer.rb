class SpreadsheetImporter
  def self.import(filename, user)
    CSV.foreach("#{Rails.root.to_s}/public/spreadsheets/#{filename}", headers: true) do |row|
      next if row["first_name"].nil? || row["first_name"] == "Sample"

      first = row["first_name"].titlecase rescue nil
      last = row["last_name"].titlecase rescue nil
      email = row["email"].downcase rescue nil
      phone = row["phone"]
      sex = row["sex"].downcase rescue nil
      grade = row["grade"].to_i rescue nil
      osis = row["osis"]

      person = Person.where(first_name: first, last_name: last).first_or_create do |p|
        p.update_attributes(
          first_name: first, last_name: last, email: email, phone: phone, sex: sex,
          grade: grade, school_id: user.school_id, osis: osis
        )
      end
    end
  end
end

