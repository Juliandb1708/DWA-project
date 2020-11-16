defmodule FitnessWeb.Router do
  use FitnessWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FitnessWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/workouts/new", WorkoutController, :create
    post "/workouts/new", WorkoutController, :add
    get "/workouts/:id", WorkoutController, :show
    post "/workouts/:id/reserve", WorkoutController, :reserve
    
    get "/instructors/new", InstructorController, :create
    post "/instructors/new", InstructorController, :add
    get "/instructors/bind", InstructorController, :bind
    post "/instructors/bind", InstructorController, :createbind
  end

  # Other scopes may use custom stacks.
  # scope "/api", FitnessWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: FitnessWeb.Telemetry
    end
  end
end
