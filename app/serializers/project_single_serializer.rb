# frozen_string_literal: true

class ProjectSingleSerializer
  include JSONAPI::Serializer

  set_id :id
  attributes :name
  attributes :stages do |project, params|
    params[:presenter].project_stages
  end
end
