defmodule TodoAppWeb.Router do
  use TodoAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: TodoAppWeb.Schema

    forward "/", Absinthe.Plug, schema: TodoAppWeb.Schema
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: TodoAppWeb.Telemetry
    end
  end
end
