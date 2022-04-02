ServicesContainer = Dry::Container::Namespace.new('services') do
  namespace(:users) do
    register(:register_compl) { Users::RegistrationComplete.new }
    register(:create_jwt) { Users::CreateJwt.new }
  end

  namespace(:sessions) do
    register(:create) { Sessions::Create.new }
  end

  namespace(:tokens) do
    register(:validate) { Tokens::Validate.new }
  end
end
