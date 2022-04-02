FormsContainer = Dry::Container::Namespace.new('forms') do
  namespace(:users) do
    register(:create) { Users::CreateForm }
    register(:register_compl) { Users::RegisterCompleteForm }
  end

  namespace(:sessions) do
    register(:create) { Sessions::CreateForm }
  end

  namespace(:projects) do
    register(:create) { Projects::CreateForm }
  end

  namespace(:tasks) do
    register(:create) { Tasks::CreateForm }
    register(:update) { Tasks::UpdateForm }
  end

  namespace(:stages) do
    register(:create) { Stages::CreateForm }
  end
end
