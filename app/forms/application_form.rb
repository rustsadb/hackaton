# frozen_string_literal: true

class ApplicationForm < Dry::Validation::Contract
  config.messages.backend = :i18n
end
