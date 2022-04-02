# frozen_string_literal: true

module Sessions
  class CreateForm < ApplicationForm
    params do
      required(:phone_number).value(:integer)
      required(:password).value(:string, min_size?: 6, max_size?: 20)
    end

    rule(:phone_number) do
      key.failure(I18n.t('api.errors.messages.wrong_number_of_digits.phone_number')) if (9..15).exclude?(value.digits.count)
    end
  end
end
