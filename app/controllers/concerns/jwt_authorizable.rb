# frozen_string_literal: true

module JwtAuthorizable
  extend ActiveSupport::Concern

  included do
    include DI[jwt_validate: 'services.tokens.validate']

    before_action :validate_token,
                  except: %i[create registration_complete ]
  end

  def validate_token
    jwt_validate.(request.headers['Authorization'])
  end

  def current_user
    @current_user ||= begin
      payload = JsonWebToken.decode(request.headers['Authorization'])
      User.find(payload['user_id'])
    end
  end
end
