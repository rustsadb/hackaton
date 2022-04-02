# frozen_string_literal: true

module Tasks
  class CreateForm < ApplicationForm
    params do
      required(:name).value(:string)
      required(:project_id).value(:integer)
      optional(:description).maybe(:string)
      optional(:important).maybe(:integer)
      optional(:deadline).maybe(:string)
    end
  end
end
