defmodule TodoApp.AuthResolverTest do
  use TodoAppWeb.ConnCase

  alias TodoApp.Auth.Resolvers, as: AuthResolver

  import TodoApp.Factory

  test "create a new register" do
    valid_attrs = %{username: "username", password: "password"}
    {:ok, result} = AuthResolver.sign_up(%{}, valid_attrs, %{})
    assert result == true
  end

  test "login user" do
    insert(:user)
    params = %{username: "username", password: "password"}
    {:ok, result} = AuthResolver.login(%{}, params, %{})
    assert String.length(result.token) > 25
  end

  test "wrong password" do
    insert(:user)
    params = %{username: "username", password: "password1"}
    {:error, result} = AuthResolver.login(%{}, params, %{})
    assert result[:message] == "Username or password are incorrect."
  end
end
