defmodule TodoApp.Factory do
  use ExMachina.Ecto, repo: TodoApp.Repo

  def user_factory do
    %TodoApp.User.Entity{
      username: Faker.Person.first_name(),
      password: Bcrypt.hash_pwd_salt("password")
    }
  end
end
