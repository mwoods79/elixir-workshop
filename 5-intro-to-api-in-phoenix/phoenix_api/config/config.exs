# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_api,
  ecto_repos: [PhoenixApi.Repo]

# Configures the endpoint
config :phoenix_api, PhoenixApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zZ/P/9PotML6/hj3VS7JDPkx+RaCq+DLYwDTnKPZg7NFXT7Ewo6/apyho68F/qrW",
  render_errors: [view: PhoenixApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
