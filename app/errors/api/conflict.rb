# frozen_string_literal: true

module Api
  class Conflict < StandardError
    attr_reader :conflict_errors

    def initialize
      super @conflict_errors = { title: I18n.t('api.errors.conflict'),
                                 status: 409,
                                 detail: message || I18n.t('api.errors.messages.already_exist') }
    end
  end
end
