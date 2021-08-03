ExUnit.configure(exclude: [external: true])
ExUnit.start()
Faker.start()
Ecto.Adapters.SQL.Sandbox.mode(TodoApp.Repo, :manual)
