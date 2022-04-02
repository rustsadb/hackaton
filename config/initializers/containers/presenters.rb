PresentersContainer = Dry::Container::Namespace.new('presenters') do
  namespace(:projects) do
    register(:single) { ProjectsPresenter }
  end
end
