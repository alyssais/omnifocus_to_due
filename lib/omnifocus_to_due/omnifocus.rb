require "rb-scpt"
require_relative "task"

module OmnifocusToDue
  module Omnifocus
    extend self

    def windows
      Appscript.app("OmniFocus").windows
    end

    def selected_tasks
      containers = windows.first.content.selected_trees
      containers.get.map { |c| Task.from_osascript(c.value.get) }
    end
  end
end
