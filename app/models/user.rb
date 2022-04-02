# frozen_string_literal: true

class User < ApplicationRecord
  include Filterable
  include ActiveModel::SecurePassword
  include Rails.application.routes.url_helpers

  has_secure_password validations: false

  MALE = 'male'
  FEMALE = 'female'

  def self.genders_const_array
    [MALE, FEMALE]
  end
end
