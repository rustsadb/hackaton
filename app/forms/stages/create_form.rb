# frozen_string_literal: true

module Stages
  class CreateForm < ApplicationForm
    params do
      required(:name).value(:string)
      required(:project_id).value(:integer)
    end
  end
end
