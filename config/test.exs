use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wallaby_white_bread_example, WallabyWhiteBreadExampleWeb.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :wallaby_white_bread_example, WallabyWhiteBreadExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "wallaby_white_bread_example_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
