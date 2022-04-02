SerializersContainer = Dry::Container::Namespace.new('serializers') do
  namespace(:users) do
    register(:single) { UserSerializer }
  end
end
