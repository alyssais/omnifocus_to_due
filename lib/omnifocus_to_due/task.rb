require_relative "repetition_rule"

module OmnifocusToDue
  class Task
    attr :name, :due_date, :repetition_rule

    def self.from_osascript(osa)
      params = { name: osa.name.get }

      time = osa.due_date.get
      params[:due_date] = time.to_i if time.is_a?(Time)

      repeat = osa.repetition_rule.get
      unless repeat == :missing_value
        params[:repetition_rule] = RepetitionRule.from_osascript(repeat)
      end

      instance = new(params)
    end

    def initialize(name:, due_date: nil, repetition_rule: nil)
      @name            = name
      @due_date        = due_date
      @repetition_rule = repetition_rule
    end
  end
end
