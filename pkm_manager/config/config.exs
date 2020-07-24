# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pkm_manager,
  ecto_repos: [PkmManager.Repo]

# Configures the endpoint
config :pkm_manager, PkmManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SniL4wbOmPo7jdXqfBu1ifeqt0MHjttZVsteEVczRlo+9iagJbztiiTTzrrCCe6S",
  render_errors: [view: PkmManagerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PkmManager.PubSub,
  live_view: [signing_salt: "GXXHBx3f"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :crawly,
  closespider_timeout: 10,
  concurrent_requests_per_domain: 8,
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    {Crawly.Middlewares.UserAgent, user_agents: ["Crawly Bot"]}
  ],
  pipelines: [
    {Crawly.Pipelines.Validate, fields: [:url, :title]},
    {Crawly.Pipelines.DuplicatesFilter, item_id: :title},
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, extension: "jl", folder: "/tmp"}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
