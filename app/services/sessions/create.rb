# frozen_string_literal: true

module Sessions
  class Create
    def call(phone_number, password)
      check_user(phone_number, password)
    end

    private

    def check_user(phone_number, password)
      user = User.find_by(phone_number: phone_number)
      raise Api::UnauthorizedError.new(I18n.t('api.errors.messages.incorrect_login_password')) if user.nil?

      auth_user = user.authenticate(password)
      raise Api::UnauthorizedError.new(I18n.t('api.errors.messages.incorrect_login_password')) unless auth_user

      auth_user
    end
  end
end
