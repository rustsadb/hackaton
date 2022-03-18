# frozen_string_literal: true

module Api
  class AccessForbiddenError < StandardError
    attr_reader :access_error

    def initialize
      super @access_error = { title: I18n.t('api.errors.access_forbidden'),
                              status: 403,
                              detail: message || I18n.t('api.errors.messages.access_forbidden') }
    end
  end
end
