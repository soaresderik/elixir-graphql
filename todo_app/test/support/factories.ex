defmodule TodoApp.Factory do
  use ExMachina.Ecto, repo: TodoApp.Repo

  def user_factory do
    %TodoApp.User.Entity{
      username: "username",
      password: Bcrypt.hash_pwd_salt("password"),
      permissions: [:create_task, :current_user_access]
    }
  end

  def todo_factory do
    %TodoApp.Todo.Entity{
      title: Faker.Lorem.sentence(3),
      description: Faker.Lorem.paragraph(1),
      done: false,
      user: build(:user)
    }
  end

  def make_admin(user) do
    %{user | permissions: [:list_all_tasks]}
  end
end
