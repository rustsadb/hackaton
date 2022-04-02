# frozen_string_literal: true

module Users
  class CreateJwt
    def call(user)
      JsonWebToken.encode({ user_id: user.id.to_s })
    end
  end
end
