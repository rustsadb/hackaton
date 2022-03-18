# frozen_string_literal: true

module Api
  class AllAttemptsUsed < StandardError
    attr_reader :attempts_errors

    def initialize
      super @attempts_errors = { title: I18n.t('api.errors.all_attempts_used'),
                                 status: 405,
                                 detail: message || I18n.t('api.errors.messages.attempts_used') }
    end
  end
end
