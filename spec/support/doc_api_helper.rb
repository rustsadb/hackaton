require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = :json
  config.request_body_formatter = :json
  config.disable_dsl_status!
end

class RspecApiDocumentation::RackTestClient < RspecApiDocumentation::ClientBase
  def response_body
    last_response.body.encode('utf-8')
  end
end
