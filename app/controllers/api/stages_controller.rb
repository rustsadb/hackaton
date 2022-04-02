# frozen_string_literal: true

module Api
  class StagesController < ApplicationController
    include DI[
                create_service: 'services.stages.create',
                create_form: 'forms.stages.create',
                single_serializer: 'serializers.stages.single'
              ]

    def create
      valid_params = validate_with(create_form, params)
      result = create_service.(valid_params)

      render_json(result, serializer: :single_serializer)
    end

    def destroy
      Stage.find(params[:id]).destroy

      render_ok
    end
  end
end
