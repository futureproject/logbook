class Logbook::StatsController < Logbook::ApplicationController
  # GET /logbook
  def index
    render template: "logbook/#{current_scope.class.name.tableize}/show"
  end

end
