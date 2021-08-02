defmodule TodoApp.AuthResolverTest do
  use TodoAppWeb.ConnCase

  alias TodoApp.Auth.Resolvers, as: AuthResolver

  test "create a new register" do
    valid_attrs = %{username: "username", password: "password"}
    {:ok, result} = AuthResolver.sign_up(%{}, valid_attrs, %{})
    assert result == true
  end
end
