# frozen_string_literal: true

module Projects
  class CreateForm < ApplicationForm
    params do
      required(:name).value(:string)
      optional(:documentation).maybe(:string)
    end
  end
end
