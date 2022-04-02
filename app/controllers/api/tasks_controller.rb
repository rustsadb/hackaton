# frozen_string_literal: true

module Api
  class TasksController < ApplicationController
    include DI[
                create_service: 'services.tasks.create',
                create_form: 'forms.tasks.create',
                single_serializer: 'serializers.tasks.single'
              ]

    def create
      valid_params = validate_with(create_form, params)
      result = create_service.(valid_params)

      render_json(result, serializer: :single_serializer)
    end
  end
end
