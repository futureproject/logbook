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

    @engagement_counts = @school.engagements.group(:kind).count
    @engagements_by_size = @school.engagements.order(:duration).group(:duration).count

    @projects = @school.projects.group(:status).count
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
  end

  private
    def sort_params
      params.slice(:by_count, :dream_team, :by_hours, :user_sort)
    end

end
