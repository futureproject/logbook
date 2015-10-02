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

    scope :filtered, -> (filter_string) {
      return unless filter_string
      association = filter_string[/(\w+_count)/]
      if !!association
        table=association.gsub("_count","")
        puts table
        puts association
        filter_string = filter_string.gsub(association, "")
        puts filter_string
        joins(table)
        .having("count(#{table}.id) > 10")
        .where(filter_string)
      #([^:]+:+[^:]+(\z|\s)) a pattern to match colon syntax
      else
        where(filter_string)
      end
    }
  end

end
