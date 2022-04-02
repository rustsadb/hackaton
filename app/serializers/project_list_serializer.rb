# frozen_string_literal: true

class ProjectListSerializer
  include JSONAPI::Serializer

  set_id :id
  attributes :name
end
