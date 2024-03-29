use Mix.Config

config :todo_app,
  ecto_repos: [TodoApp.Repo]

config :todo_app, TodoApp.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :todo_app, TodoAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4dDMejtOEsaofpuaobDPZai9l2S90uRtqiEV2oICRZcyT5NqZ3wYDtRSMwwUrQI6",
  render_errors: [view: TodoAppWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TodoApp.PubSub,
  live_view: [signing_salt: "UCgQE8nZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :absinthe,
  log: false

config :todo_app, TodoApp.Guardian,
  issuer: "todo_app",
  secret_key: "sFbROjM6xLzPdjalZAT9ifApzIzdsyuT0fZpXzVzEw4G5SkX3mvKj9NudWWUb9Uc"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
