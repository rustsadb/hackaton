# frozen_string_literal: true

module Api
  class UnauthorizedError < StandardError
    attr_reader :unauthorized_errors

    def initialize(message = nil)
      super @unauthorized_errors = { title: I18n.t('api.errors.authentication'),
                                     status: 401,
                                     detail: message || I18n.t('api.errors.messages.not_logged_in') }
    end
  end
end
