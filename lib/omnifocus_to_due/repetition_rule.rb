require "ice_cube"

module OmnifocusToDue
  class RepetitionRule
    attr :repetition_method, :unit, :interval, :days

    def self.from_osascript(osa)
      rule = IceCube::Rule.from_ical(osa[:recurrence]).to_hash
      new(
        repetition_method: osa[:repetition_method],
        unit: rule[:rule_type].match(/::(.*)Rule/)[1].downcase.to_sym,
        interval: rule[:interval],
        days: rule[:validations][:day],
      )
    end

    def initialize(repetition_method:, unit:, interval:, days:)
      @repetition_method = repetition_method
      @unit              = unit
      @interval          = interval
      @days              = days
    end

    def fixed?
      repetition_method == :fixed_repetition
    end
  end
end
