use Mix.Config

# For production, we configure the host to read the PORT
# from the system environment. Therefore, you will need
# to set PORT=80 before running your server.
#
# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
#
# Finally, we also include the path to a manifest
# containing the digested version of static files. This
# manifest is generated by the mix phoenix.digest task
# which you typically run after static files are built.
config :tilex, TilexWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: {:system, "HOST"}, port: {:system, "PORT"}],
  secret_key_base: {:system, "SECRET_KEY_BASE"},
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Application.spec(:myapp, :vsn)

# comment

# Do not print debug messages in production
config :logger, level: :info

config :tilex, Tilex.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "",
  url: {:system, "DATABASE_URL"},
  pool_size: 10,
  ssl: true

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :tilex, TilexWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
config :tilex, TilexWeb.Endpoint,
  force_ssl: [rewrite_on: [:x_forwarded_proto]]

# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
# config :tilex, TilexWeb.Endpoint, server: true
#

# Finally import the config/prod.secret.exs
# which should be versioned separately.

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: {:system, "GOOGLE_CLIENT_ID"},
  client_secret: {:system, "GOOGLE_CLIENT_SECRET"}

if {:system, "ENABLE_BASIC_AUTH"} do
  config :tilex, :basic_auth, [
    realm: "tilex",
    username: {:system, "BASIC_AUTH_USERNAME"},
    password: {:system, "BASIC_AUTH_PASSWORD"},
  ]
end

config :tilex, :page_size, 50
config :tilex, :auth_controller, AuthController
config :tilex, :slack_notifier, Tilex.Notifications.Notifiers.Slack
config :tilex, :twitter_notifier, Tilex.Notifications.Notifiers.Twitter
config :tilex, :organization_name, "Walter McGinnis"
config :tilex, :ga_identifier, {:system, "GA_IDENTIFIER"}
config :tilex, :canonical_domain, {:system, "CANONICAL_DOMAIN"}
config :tilex, :default_twitter_handle, {:system, "DEFAULT_TWITTER_HANDLE"}
config :tilex, :cors_origin, {:system, "CORS_ORIGIN"}

# end
