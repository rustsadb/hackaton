# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require "rspec/rails"
require "spec_helper"

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

RSpec.shared_context 'api' do
  let(:response_json) { JSON.parse(response_body) }
  let(:response_data) { JSON.parse(response_body)['data'] }
  let(:response_errors) { JSON.parse(response_body)['errors'] }
  let(:response_attributes) { JSON.parse(response_body)['data']['attributes'] }
  let(:empty_response) { { 'data' => nil, 'errors' => nil } }
end

RSpec.configure do |config|
  config.include_context 'api'
  config.include ResponseHelper
  config.use_transactional_fixtures = true
  config.include FactoryBot::Syntax::Methods
end
