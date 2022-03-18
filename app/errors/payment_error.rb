# frozen_string_literal: true

module Api
  class PaymentError < StandardError
    attr_reader :payment_error

    def initialize
      super @record_not_found_errors = { title: I18n.t('api.errors.payment'),
                                         status: 402,
                                         detail: message || I18n.t('api.errors.messages.not_enough_money') }
    end
  end
end
