class DataController < ApplicationController
  skip_before_action :authenticate!, only: [:index]
  skip_before_action :init_js_data
  layout 'data'

  def index
    @active_ppl = {}
    @passive_ppl = {}
    Site.order(:name).each{|site|
      durations = site.schools.map{|school| school.headcount }
      people =  (site.people.joins(:primary_projects) + site.people.joins(:secondary_projects)).uniq.count
      @passive_ppl[site.name] = durations.inject(:+)
      @active_ppl[site.name] = people
    }

    @person_hrs = Engagement::KIND_ENUM.map{|kind|
      data = {}
      Site.order(:name).each {|site| data[site.name] = site.person_hours(kind) }
      { name: kind, data: data }
    }

    @engagement_counts = Engagement::KIND_ENUM.map{|kind|
      data = {}
      Site.order(:name).each {|s| data[s.name] = s.engagements.where(kind: kind).count }
      { name: kind, data: data }
    }

    @weekly_engagements = Engagement::KIND_ENUM.map {|kind|
      data = Engagement.where(kind: kind).since(Date.new(2015,01,01)).group_by_day_of_week(:date).count
      Date::DAYNAMES.each_with_index{|d,i| data[d] = data.delete (i-1)%7 }
      { name: kind, data: data }
    }

    @schools = %w(projects engagements).map{|table|
      data = {}
      School.by_count(:engagements).limit(10).each{|s| data[s.name] = eval("s.#{table}.count") }
      { name: table.capitalize, data: data }
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

end
