# frozen_string_literal: true

module Api
  class TimeNotPassed < StandardError
    attr_reader :time_not_passed_error

    def initialize(time, attempts_left)
      super @time_not_passed_error = { title: I18n.t('api.errors.time_not_passed'),
                                       status: 425,
                                       detail: message || I18n.t('api.errors.messages.time_has_not_passed'),
                                       meta: { time_to_next_attempt: time, attempts_left: attempts_left } }
    end
  end
end
