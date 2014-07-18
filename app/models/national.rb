class National

  def self.average association, column=nil
    if column.nil?
      (eval(association.to_s.classify).count.fdiv(School.count)).to_i
    else
      eval(association.to_s.classify).average(column.to_sym)
    end
  end

  #def self.engagement_score
  #  WeeklyLogEntry.average(:quality)
  #end
  #def self.attendance_score
  #  attended = WeeklyLogEntry.where(attended_meeting: true).count
  #  total = WeeklyLogEntry.count
  #  (attended.to_f / total.to_f).to_s
  #end
end
