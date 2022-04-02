SerializersContainer = Dry::Container::Namespace.new('serializers') do
  namespace(:users) do
    register(:single) { UserSerializer }
  end

  namespace(:projects) do
    register(:single) { ProjectSingleSerializer }
    register(:list) { ProjectListSerializer }
  end

  namespace(:tasks) do
    register(:single) { TaskSingleSerializer }
  end

  namespace(:stages) do
    register(:single) { StageSingleSerializer }
  end
end
