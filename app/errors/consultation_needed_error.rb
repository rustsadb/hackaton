# frozen_string_literal: true

module Api
  class ConsultationNeededError < StandardError
    attr_reader :consultation_needed_error

    def initialize
      super @consultation_needed_error = { title: I18n.t('api.errors.consultation_needed'),
                                           status: 403,
                                           detail: I18n.t('api.errors.messages.consultation_needed') }
    end
  end
end
