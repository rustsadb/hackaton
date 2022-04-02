# frozen_string_literal: true

module Users
  class RegisterCompleteForm < CreateForm
    params do
      required(:password).value(:string, min_size?: 8, max_size?: 39)
      required(:name).value(:string)
      optional(:email).maybe(:string)
      optional(:gender).value(:string, included_in?: User.genders_const_array)
      optional(:avatar_id).maybe(:integer, gteq?: 1)
    end

    rule(:email) do
      key.failure(I18n.t('api.errors.messages.not_email_format')) unless value.nil? ||
                                                                         /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
      key.failure(I18n.t('api.errors.messages.email_not_unique')) if value.present? &&
                                                                     User.find_by('lower(email) = ?', value.downcase)
    end
  end
end
