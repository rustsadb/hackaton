# frozen_string_literal: true

module Api
  class ProjectsController < ApplicationController
    include DI[
                create_service: 'services.projects.create',
                create_form: 'forms.projects.create',
                single_serializer: 'serializers.projects.single'
              ]

    def create
      valid_params = validate_with(create_form, params)
      result = create_service.(valid_params)

      render_json(result, serializer: :single_serializer)
    end
  end
end
