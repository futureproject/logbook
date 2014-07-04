module WeeklyLogEntriesHelper
  def next_person(people)
    people = people - people.joins(:entry_this_week)
    people.first
  end
end
