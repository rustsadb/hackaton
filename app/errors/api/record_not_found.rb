# frozen_string_literal: true

module Api
  class RecordNotFound < StandardError
    attr_reader :record_not_found_errors

    def initialize
      super @record_not_found_errors = { title: I18n.t('api.errors.record_not_found'),
                                         status: 404,
                                         detail: message || I18n.t('api.errors.messages.record_not_exists') }
    end
  end
end
