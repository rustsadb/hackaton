# frozen_string_literal: true

module ResponseHelper
  def parse_response_body(response_body)
    JSON.parse(response_body)
  end
end
