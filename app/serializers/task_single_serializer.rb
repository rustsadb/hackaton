# frozen_string_literal: true

class TaskSingleSerializer
  include JSONAPI::Serializer

  set_id :id
  attributes :name, :description, :deadline, :important
end
