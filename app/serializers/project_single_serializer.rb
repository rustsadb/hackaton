# frozen_string_literal: true

class ProjectSingleSerializer
  include JSONAPI::Serializer

  set_id :id
  attributes :name
end
