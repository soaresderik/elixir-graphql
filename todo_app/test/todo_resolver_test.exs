defmodule TodoApp.TodoResolverTest do
  use TodoAppWeb.ConnCase

  alias TodoApp.Todos.Resolvers, as: TodoResolver

  import TodoApp.Factory

  test "create a new task" do
    user = insert(:user)
    params = %{title: "Elixir e Graphql", description: "Criar uma api usando Elixir e Graphql"}

    {:ok, result} = TodoResolver.create_task(nil, params, %{context: %{current_user: user}})
    assert result.title == params.title
  end

  test "list all tasks" do
    user = insert(:user) |> make_admin
    insert(:todo, user: user)
    {:ok, result} = TodoResolver.list(nil, %{}, %{context: %{current_user: user}})

    assert Kernel.length(result) > 0
  end
end
