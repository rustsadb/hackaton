# frozen_string_literal: true

module Api
  class UnprocessableEntityException < StandardError
    attr_reader :validation_errors

    def initialize(errors)
      super
      @validation_errors = format_errors(errors)
    end

    private

    def format_errors(errors)
      errors.map do |e|
        field = e.first
        reason = e.last[0]
        {
          title: reason,
          status: 422,
          source: { pointer: "data/attributes/#{field}" },
          detail: reason
        }
      end
    end
  end
end
