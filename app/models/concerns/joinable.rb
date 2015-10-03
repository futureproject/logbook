module Joinable
  extend ActiveSupport::Concern

  included do
    scope :with_association, -> (table, dates=10.years.ago..Date.today) {
      primary_column = self.name.tableize
      joins(table.to_sym)
      .select("#{primary_column}.*, COUNT(#{table}.id) AS #{table}_count")
      .merge(table.to_s.classify.constantize.btw(dates))
      .group("#{primary_column}.id")
    }

    scope :conditionally_joined, -> (params, stat_times) {
      if params[:sort_by] && params[:sort_by].match(/_count/i)
        table_name = params[:sort_by].split('_').first
        with_association(table_name, stat_times)
      elsif params[:sort_by] && params[:sort_by].match(/last_engaged/i)
        where("last_engaged IS NOT NULL")
      elsif params[:q]
        q(params[:q])
      else
        logbook_default
      end
    }
    scope :logbook_default, -> { btw(StatCollector.default_range) }
    scope :btw, -> (range) { where(created_at: range) }
    scope :q, -> (query) { where("name like ?", "%#{query.downcase}%") }
  end

end
