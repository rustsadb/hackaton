# frozen_string_literal: true
require_relative 'containers/forms'
require_relative 'containers/queries'
require_relative 'containers/serializers'
require_relative 'containers/services'
require_relative 'containers/helpers'
require_relative 'containers/presenters'

class DryContainer
  extend Dry::Container::Mixin

  import FormsContainer
  import QueriesContainer
  import SerializersContainer
  import ServicesContainer
  import HelpersContainer
  import PresentersContainer
end

DI = Dry::AutoInject(DryContainer)
