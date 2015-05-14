class Logbook::SitesController < Logbook::ApplicationController
  skip_before_action :authorize!
  layout 'data'

  # GET /logbook
  def index
    params[:user_sort] = 'id' if sort_params.empty?
    @sites = Site.sort(sort_params)
  end

  def show
    @site = Site.find params[:id]
    @person_hrs = Engagement::KIND_ENUM.map{|kind|
      data = {}
      @site.schools.order(:name).each {|school| data[school.name] = school.person_hours(kind) }
      { name: kind, data: data }
    }
    @engagement_counts = Engagement::KIND_ENUM.map{|kind|
      data = {}
      @site.schools.order(:name).each {|s| data[s.name] = s.engagements.where(kind: kind).count }
      { name: kind, data: data }
    }
    @active_ppl = {}
    @passive_ppl = {}
    @site.schools.order(:name).each{|school|
      people = (school.people.joins(:primary_projects) + school.people.joins(:secondary_projects)).uniq.count
      @passive_ppl[school.name] = school.headcount
      @active_ppl[school.name] = people
    }
    @chart_options = {
      chart: { backgroundColor: '#1e2427' },
      xAxis: {
        labels: {
          style: {
            color: '#f8f3f3'
          }
        }
      },
      yAxis: {
        labels: {
          style: {
            color: '#f8f3f3'
          }
        }
      },
      legend: {
        itemStyle: { color: '#f8f3f3' },
        itemHoverStyle: { color: '#fbe588' },
      },
      plotOptions: {
        series: {
          stacking: true,
        }
      }
    }
  end

  private
    def sort_params
      params.slice(:by_count, :user_sort)
    end

end
