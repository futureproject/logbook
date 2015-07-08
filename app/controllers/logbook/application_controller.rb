class Logbook::ApplicationController < ApplicationController
  layout 'logbook'

  def home
    redirect_to url_for([:logbook, current_scope])
  end

  def dashboard
    self.instance_variable_set "@#{current_scope.class.name.downcase}", current_scope
    render template: "logbook/#{current_scope.class.name.tableize}/show"
  end

end
