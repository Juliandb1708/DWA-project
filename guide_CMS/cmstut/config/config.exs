# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cmstut,
  ecto_repos: [Cmstut.Repo]

# Configures the endpoint
config :cmstut, CmstutWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "e6rfPnfZOVy8f9t+RRNV3/+eKSm485cc6GBRard4k8yveknroAYnlJXdB5iR4u+d",
  render_errors: [view: CmstutWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Cmstut.PubSub,
  live_view: [signing_salt: "klYZFYLy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
