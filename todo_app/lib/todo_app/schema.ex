defmodule TodoApp.Schema do
  use Absinthe.Schema

  import_types(TodoApp.Todos.Types)
  import_types(TodoApp.Auth.Types)
  import_types(TodoApp.User.Types)

  query do
    import_fields(:todo_queries)
    import_fields(:user_queries)
  end

  mutation do
    import_fields(:auth_mutations)
    import_fields(:todo_mutations)
  end
end
