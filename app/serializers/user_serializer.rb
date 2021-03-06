# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer

  set_id :id
  attributes :phone_number, :name, :email, :gender
end
