# frozen_string_literal: true

module Api
  class ProjectsController < ApplicationController
    include DI[
                create_service: 'services.projects.create',
                create_form: 'forms.projects.create',
                single_serializer: 'serializers.projects.single',
                list_serializer: 'serializers.projects.list',
                presenter: 'presenters.projects.single'
              ]
    def index
      result = Project.all

      render_json(result, serializer: :list_serializer)
    end

    def create
      valid_params = validate_with(create_form, params)
      result = create_service.(valid_params)

      render_json(result, serializer: :single_serializer)
    end

    def show
      result = Project.find(params[:id])

      render_json(result, serializer: :single_serializer, options: { params: { presenter: presenter.new(result) } })
    end

    def destroy
      Project.find(params[:id]).destroy

      render_ok
    end
  end
end
