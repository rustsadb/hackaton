# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    include DI[
                create_form: 'forms.users.create',
                serializer: 'serializers.users.single'
              ]

    def create
      valid_params = validate_with(create_form, params)
      user = User.find_by(phone_number: valid_params[:phone_number])
      raise Api::UnprocessableEntityException.new({ registration: 'user exists' }) if user.present?

      user = User.create!(phone_number: valid_params[:phone_number])

      render_json(user)
    end

    # def confirmation
    #   valid_params = validate_with(confirm_validator, params)
    #   result = user_confirmation.(valid_params[:phone_number], valid_params[:confirmation_code])

    #   render_json(result)
    # end

    # def registration_complete
    #   valid_params = validate_with(reg_complete_form, params)
    #   result = register_compl_service.(valid_params[:phone_number], valid_params[:confirmation_code], valid_params)
    #   response.headers['Authorization'] = create_jwt.(result)

    #   render_json(result)
    # end

    # def send_recovery
    #   valid_params = validate_with(recover_form, params)
    #   create_recover.(valid_params[:phone_number], valid_params[:email])

    #   render_ok
    # end

    # def confirm_recovery_code
    #   valid_params = validate_with(confirm_recover_form, params)
    #   result = confirm_recover.(valid_params[:recovery_code], valid_params[:phone_number], valid_params[:email])

    #   render_json(result, serializer: :recovery_token)
    # end

    # def change_password
    #   valid_params = validate_with(change_pass_form, params)
    #   result = password_changer.(valid_params[:token], valid_params[:new_password])

    #   render_json(result)
    # end

    # def profile
    #   render_json(current_user, serializer: :profile_serializer, options: { params: { avatar: current_user.images.avatar.first } })
    # end

    # def profile_edit
    #   valid_params = validate_with(profile_validator, params)
    #   result = profile_edit_service.(current_user, valid_params)
    #   response.headers['Authorization'] = create_jwt.(result)

    #   render_json(result, serializer: :profile_serializer, options: { params: { avatar: current_user.images.avatar.first } })
    # end

    # def change_password_authorized
    #   valid_params = validate_with(change_password_form, params)
    #   result = auth_password_changer.(current_user, valid_params[:new_password], valid_params[:old_password])

    #   render_json(result)
    # end

    # def profile_setting
    #   render_json(current_user.user_setting, serializer: :profile_setting_serializer)
    # end

    # def profile_setting_edit
    #   valid_params = validate_with(setting_edit_form, params)
    #   result = profile_setting_edit_service.(current_user, valid_params)

    #   render_json(result, serializer: :profile_setting_serializer)
    # end

    # def change_phone_number
    #   valid_params = validate_with(change_phone_number_form, params)
    #   unless current_user.authenticate(valid_params[:password])
    #     raise Api::UnprocessableEntityException.new({ password: [I18n.t('api.errors.messages.incorrect_password')] })
    #   end

    #   result = send_confirm_code_for_new_phone_number.(current_user, valid_params[:phone_number])

    #   render_json(result[:user], options: { meta: { time: result[:seconds_to_next_attempt], phone_number: result[:phone_number] } })
    # end

    # def confirmation_new_phone_number
    #   valid_params = validate_with(confirm_validator, params)
    #   result = phone_number_changer.(current_user, valid_params[:phone_number], valid_params[:confirmation_code])

    #   render_json(result)
    # end
  end
end
