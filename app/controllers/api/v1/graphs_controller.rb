class Api::V1::GraphsController < Api::V1::BaseController
  before_action :set_scope
  before_action :set_time

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
    def set_scope
      # USE PARAMS[SCOPE] and [SCOPE_ID]
      if params[:scope_type] && params[:scope_id]
        klass = params[:scope_type].classify.constantize
        id = params[:scope_id].to_i
        @scope = klass.find(id)
      else
        @scope = current_scope
      end
    end

    def set_time
      @t = stat_times
    end
end
