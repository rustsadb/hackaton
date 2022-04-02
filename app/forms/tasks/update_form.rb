# frozen_string_literal: true

module Tasks
  class UpdateForm < ApplicationForm
    params do
      required(:id).value(:integer)
      required(:stage_id).value(:integer)
    end
  end
end
