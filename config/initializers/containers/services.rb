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

  namespace(:projects) do
    register(:create) { Projects::Create.new }
  end

  namespace(:tasks) do
    register(:create) { Tasks::Create.new }
  end

  namespace(:stages) do
    register(:create) { Stages::Create.new }
  end
end
