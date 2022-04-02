# frozen_string_literal: true

class StageSingleSerializer
  include JSONAPI::Serializer

  set_id :id
  attributes :name
end
