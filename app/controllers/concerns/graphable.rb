module Graphable
  extend ActiveSupport::Concern

  included do
    before_action :set_scope, only: self.instance_methods
    before_action :set_time, only: self.instance_methods
  end

  def project_percentage_graph
    graph_data = StatCollector.project_percentage_data(
      scope: @scope,
      total: @scope.enrollment,
      dates: @t
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "#{graph_data.first[:data].first(2).map{|key| key[:y]}.reduce(:+)} people have projects.",
      colors: Person::COLOR_ENUM,
    }
  end


  def engagement_percentage_graph
    graph_data = StatCollector.engagement_percentage_data(
      scope: @scope,
      total: @scope.enrollment,
      dates: @t,
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "#{graph_data.first()[:data].first[:y]} people attended an engagement.",
      colors: [Person::COLOR_ENUM[0], Person::COLOR_ENUM[2]]
    }
  end

  def logged_hours_graph
    graph_data = StatCollector.logged_hours_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "Students logged #{graph_data.first()[:data].map{|key| key[:y]}.reduce(:+)} hours.",
      colors: Engagement::COLOR_ENUM
    }
  end

  def program_hours_graph
    graph_data = StatCollector.program_hours_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "#{@scope.shortname} offered #{graph_data.first()[:data].map{|key| key[:y]}.reduce(:+)} program hours...",
      colors: Engagement::COLOR_ENUM
    }
  end

  def engagement_counts_graph
    graph_data = StatCollector.engagement_counts_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "... spread across #{graph_data.first()[:data].map{|key| key[:y]}.reduce(:+)} engagements.",
      colors: Engagement::COLOR_ENUM
    }
  end

  def project_counts_graph
    graph_data = StatCollector.project_counts_data(
      scope: @scope,
      status: params[:status]
    )
    render json: {
      data: graph_data,
      type: 'pie',
      title: "#{graph_data.first[:data].map{|x| x[:y]}.reduce(:+)} Projects #{params[:status].to_s}",
    }
  end

  def weekly_rhythm_graph
    graph_data = StatCollector.weekly_rhythm_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'bar',
      title: "Engagements by day of week:",
      colors: Engagement::COLOR_ENUM,
      categories: Date::DAYNAMES
    }
  end

  def hours_per_person_graph
    graph_data = StatCollector.hours_per_person_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'column',
      title: "Students logged #{@scope.person_hours} hours.",
      colors: Person::COLOR_ENUM,
    }
  end

  def people_context_graph
    graph_data = StatCollector.people_context_data(
      scope: @scope
    )
    render json: {
      data: graph_data,
      type: 'bar',
      separated: true,
      title: "People",
      colors: Person::COLOR_ENUM,
      categories: ['School', 'City Avg', 'National Avg']
    }
  end

  def projects_context_graph
    graph_data = StatCollector.projects_context_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'bar',
      title: "Projects",
      colors: Project::COLOR_ENUM,
      categories: ['School', 'City Avg', 'National Avg']
    }
  end

  def projects_timeline_graph
    graph_data = StatCollector.projects_timeline_data(
      scope: @scope,
    )
    title =  "#{graph_data.map{|k,v| k[:data].last.last}.reduce(:+)} people have projects."
    render json: {
      data: graph_data,
      type: 'areaspline',
      x_axis_type: 'datetime',
      title: title,
      colors: Project::COLOR_ENUM,
    }
  end

  def people_timeline_graph
    graph_data = StatCollector.people_timeline_data(
      scope: @scope,
      dates: @t
    )
    render json: {
      data: graph_data,
      type: 'areaspline',
      x_axis_type: 'datetime',
      title: "#{graph_data.map{|k,v| k[:data].last.last}.reduce(:+)} people have been engaged.",
      colors: Person::COLOR_ENUM,
    }
  end

  def engagements_per_week_graph
    graph_data = StatCollector.engagements_per_week_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'areaspline',
      x_axis_type: 'datetime',
      title: "Engagements per week:",
      colors: @scope.is_a?(School)? Engagement::COLOR_ENUM : nil
    }
  end

  def engagements_context_graph
    graph_data = StatCollector.engagements_context_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'bar',
      title: "Engagements all around!",
      colors: Engagement::COLOR_ENUM,
      x_axis_type: 'category'
    }
  end

  def people_bubbles_graph
    graph_data = StatCollector.people_bubble_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'bubble',
      header_format: "",
      point_format: "<b>{point.title}</b><br>{series.name}<br>{point.x} Hours, {point.y} Engagements<br>{point.z} Projects",
      title: "Engaged People",
      colors: Person::COLOR_ENUM,
    }
  end

  def projects_scatter_graph
    graph_data = StatCollector.projects_scatter_data(
      scope: @scope,
    )
    render json: {
      data: graph_data,
      type: 'scatter',
      x_axis_type: 'datetime',
      header_format: "",
      point_format: "<b>{point.title}</b><br>{series.name}<br>{point.y} People<br>{point.description}",
      title: "Project Start Date (x) & Team Size (y)",
      colors: Project::COLOR_ENUM,
    }
  end

  private
    def set_time
      @t = stat_times
    end

end
