defmodule TodoApp.Schema do
  use Absinthe.Schema

  import_types(TodoApp.Todos.Types)
  import_types(TodoAppWeb.Auth.Types)

  query do
    import_fields(:todo_queries)
  end

  mutation do
    import_fields(:auth_mutations)
    import_fields(:todo_mutations)
  end
end
