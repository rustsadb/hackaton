# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    include DI[
                create_form: 'forms.users.create',
                serializer: 'serializers.users.single',
                reg_complete_form: 'forms.users.register_compl',
                register_compl_service: 'services.users.register_compl',
                create_jwt: 'services.users.create_jwt',
              ]

    def create
      valid_params = validate_with(create_form, params)
      user = User.find_by(phone_number: valid_params[:phone_number])
      raise Api::UnprocessableEntityException.new({ registration: 'user exists' }) if user.present?

      user = User.create!(phone_number: valid_params[:phone_number])

      render_json(user)
    end

    def registration_complete
      valid_params = validate_with(reg_complete_form, params)
      result = register_compl_service.(valid_params[:phone_number], valid_params)
      response.headers['Authorization'] = create_jwt.(result)

      render_json(result)
    end
  end
end
