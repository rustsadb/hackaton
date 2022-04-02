# frozen_string_literal: true

module Api
  class TasksController < ApplicationController
    include DI[
                create_service: 'services.tasks.create',
                create_form: 'forms.tasks.create',
                single_serializer: 'serializers.tasks.single',
                update_form: 'forms.tasks.update',
                update_service: 'services.tasks.update'
              ]

    def create
      valid_params = validate_with(create_form, params)
      result = create_service.(valid_params)

      render_json(result, serializer: :single_serializer)
    end

    def update
      valid_params = validate_with(update_form, params)
      result = update_service.(valid_params)

      render_json(result, serializer: :single_serializer)
    end

    def show
      result = Task.find(params[:id])

      render_json(result, serializer: :single_serializer)
    end

    def destroy
      Task.find(params[:id]).destroy

      render_ok
    end
  end
end
