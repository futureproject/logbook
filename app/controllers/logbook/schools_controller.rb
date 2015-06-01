class Logbook::SchoolsController < Logbook::ApplicationController

  # GET /logbook
  def index
    params[:user_sort] = 'name' if sort_params.empty?
    @schools = current_scope.schools.sort(sort_params)
    @empty_schools = current_scope.schools - @schools
  end

  def show
    @school = School.find params[:id]

    @person_hrs = {}
    Engagement::KIND_ENUM.each do |kind|
      @person_hrs[kind] = @school.person_hours(kind)
    end

    @dd_hrs = {}
    Engagement::KIND_ENUM.each do |kind|
      @dd_hrs[kind] = @school.engagements.where(kind: kind).sum(:duration)
    end

    @engagement_counts = @school.engagements.order(:kind).group(:kind).count
    @engagements_in_context = {
      "#{@school.name}" => @school.engagements.count,
      "#{@school.site.try(:name)} Avg" => @school.site.engagements.count / @school.site.schools.count,
      "National Avg" => Engagement.count / School.count
    }
    @engagement_pct = {
      "Logbook Estimate" => "#{(@school.engaged_people.count.fdiv(@school.size)*100).to_i}%",
      "Rough Estimate" => "#{(@school.headcount.fdiv(@school.size)*100).to_i}%"
    }
    logger.info @engagement_pct
    @weekly_engagements = Engagement::KIND_ENUM.map {|kind|
      data = @school.engagements.where(kind: kind).group_by_day_of_week(:date).count
      Date::DAYNAMES.each_with_index{|d,i| data[d] = data.delete (i-1)%7 }
      { name: kind, data: data }
    }
    @chart_options = {
      plotOptions: {
        series: {
          stacking: true,
        }
      }
    }
    @projects = @school.projects.group(:status).count
    @projects_in_context = {
      "#{@school.name}" => @school.projects.count,
      "City Avg" => @school.site.projects.count / @school.site.schools.count,
      "National Avg" => Project.count / School.count
    }
  end

  private
    def sort_params
      params.slice(:by_count, :dream_team, :by_hours, :user_sort)
    end

end
