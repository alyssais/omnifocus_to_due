require "rb-scpt"

module OmnifocusToDue
  module Finder
    extend self

    def open_url(url)
      Appscript.app("Finder").open_location(url)
    end
  end
end
