# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenixcra,
  ecto_repos: [Phoenixcra.Repo]

# Configures the endpoint
config :phoenixcra, PhoenixcraWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XBeXQv3e0f9JVX/Gw1uPrSH409sEGpj5b4pa52XEcWNuPxlQubKmZG2e5KP47h3F",
  render_errors: [view: PhoenixcraWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Phoenixcra.PubSub,
  live_view: [signing_salt: "SEkKd4Aj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
