# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    include DI[
               log_in: 'services.sessions.create',
               create_form: 'forms.sessions.create',
               create_jwt: 'services.users.create_jwt',
               serializer: 'serializers.users.single'
              ]

    def create
      valid_params = validate_with(create_form, params)
      result = log_in.(valid_params[:phone_number], valid_params[:password])
      response.headers['Authorization'] = create_jwt.(result)

      render_json(result)
    end
  end
end
