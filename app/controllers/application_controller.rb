# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DryValidatable
  include JsonRenderable
  include ErrorsHandler
  require 'json_web_token'
end
