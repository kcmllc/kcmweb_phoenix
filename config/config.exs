# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :phoenix, KcmwebPhoenix.Router,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  https: false,
  secret_key_base: "RpG9abYJ0NJao2U4PIX8tBnkFmkrgnLq1/0aHvZSPxQwfda1gIK7W/sl4wAx/YEpwKwp3PERB6zIm+w2ukWXdA==",
  catch_errors: true,
  debug_errors: false,
  error_controller: KcmwebPhoenix.PageController

# Session configuration
config :phoenix, KcmwebPhoenix.Router,
  session: [store: :cookie,
            key: "_kcmweb_phoenix_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
