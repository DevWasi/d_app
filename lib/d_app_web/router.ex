defmodule DAppWeb.Router do
  use DAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DAppWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :guardian do
    plug DApp.Auth.AuthAccessPipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", DAppWeb do
    pipe_through :browser

    live "/", PageLive, :index
    post "/login", SessionController, :login
    post "/signup", SessionController, :signup
    live "/login", LoginLive.Form
    live "/signup", SignUpLive.Form

    pipe_through [:guardian, :ensure_auth]
      live "/home", HomeLive.Index
      live "/quizes", QuizLive.Quizes
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DAppWeb.Telemetry
    end
  end
end
