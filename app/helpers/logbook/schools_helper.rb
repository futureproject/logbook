module Logbook::SchoolsHelper

  def school_in_context(school)
    school.data_for_context_graph
  end

  def people_with_projects(school)
    Person.as_project_pie_chart(school.people, school.headcount)
  end

  def person_hours(school)
    hrs = {}
    Engagement::KIND_ENUM.each do |kind|
      hrs[kind] = school.person_hours(kind)
    end
    hrs
  end

  def program_hours(school)
    hrs = {}
    Engagement::KIND_ENUM.each do |kind|
      hrs[kind] = school.engagements.where(kind: kind).sum(:duration)
    end
    hrs
  end

  def engagement_counts(school)
    school.engagements.order(:kind).group(:kind).count
  end

  def people_at_engagements(school)
    Person.as_engagement_pie_chart(@school.people, @school.headcount)
  end

  def weekly_engagements(school)
    Engagement::KIND_ENUM.map {|kind|
      data = school.engagements.where(kind: kind).group_by_day_of_week(:date).count
      Date::DAYNAMES.each_with_index{|d,i| data[d] = data.delete (i-1)%7 }
      { name: kind, data: data }
    }
  end

  def engagements_in_context(school)
    {
      "School" => @school.engagements.count,
      "City Avg" => @school.site.engagements.count / @school.site.schools.count,
      "National Avg" => Engagement.count / School.count
    }
  end

  def projects_in_context(school)
    {
      "School" => school.projects.count,
      "City Avg" => school.site.projects.count / school.site.schools.count,
      "National Avg" => Project.count / School.count
    }
  end

end
