# frozen_string_literal: true

module AdminAccess
  extend ActiveSupport::Concern

  included do
    before_action :validate_admin
  end

  def validate_admin
    raise Api::AccessForbiddenError unless current_user.admin?
  end
end
