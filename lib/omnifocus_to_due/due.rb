require "uri"
require_relative "finder"

module OmnifocusToDue
  module Due
    extend self

    def add_task(task, source_name: nil, source_url: nil)
      params = {
        title: task.name,
        duedate: task.due_date,
      }

      if repeat = task.repetition_rule
        params.merge!(
          recurunit: unit(repeat),
          recurfreq: repeat.interval,
          recurbyday: adjsuted_days(repeat.days),
        )

        params[:repeatfromdate] = task.due_date if repeat.fixed?
      end

      params[:"x-source"] = source_name
      params[:"x-success"] = source_url

      Finder.open_url(url(params))
    end

    protected

    def url(params)
      "due://x-callback-url/add?#{query_string(params)}"
    end

    def query_string(params)
      URI.encode_www_form(params).gsub(?+, "%20")
    end

    def unit(rule)
      p case p rule.unit
      when :weekly then 256
      when :monthly then 8
      when :yearly then 4
      else 16
      end
    end

    def adjsuted_days(days)
      days.map { |d| (d + 1) % 7 } if days
    end
  end
end
