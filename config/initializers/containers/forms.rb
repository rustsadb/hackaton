FormsContainer = Dry::Container::Namespace.new('forms') do
  namespace(:users) do
    register(:create) { Users::CreateForm }
  end
end
