# frozen_string_literal: true

module Users
  class RegistrationComplete
    def call(phone_number, params)
      user = User.find_by!(phone_number: phone_number)
      update_user(user, params)

      user
    end

    def update_user(user, params)
      user.update!(password: params[:password], name: params[:name], email: params[:email], gender: params[:gender])
    end
  end
end
