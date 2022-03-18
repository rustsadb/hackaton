# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DryValidatable
  include JsonRenderable
  include ErrorsHandler
  include JwtAuthorizable
  require 'json_web_token'

  before_action :set_locale

  private

  def set_locale
    I18n.locale = request.headers['User-Locale'] || I18n.default_locale
  end
end
