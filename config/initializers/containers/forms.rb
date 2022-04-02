FormsContainer = Dry::Container::Namespace.new('forms') do
  namespace(:users) do
    register(:create) { Users::CreateForm }
    register(:register_compl) { Users::RegisterCompleteForm }
  end

  namespace(:sessions) do
    register(:create) { Sessions::CreateForm }
  end
end
