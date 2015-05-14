# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for third-
# party users, it should be done in your mix.exs file.

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"

config :ex_twitter, :oauth, [
  consumer_key: "changeme",
  consumer_secret: "changeme",
  access_token: "changeme",
  access_token_secret: "changeme"
]

config :reivax, :search, [
  {["recherche développeur",
    "recherche développeur front-end",
    "recherche développeur back-end",
    "recherche développeur ruby",
    "recherche développeur site web",
    "recherche développeur site internet",
    "recherche développeur freelance"],"dev"}
]
