defmodule ReivaxHttp.Mixfile do
  use Mix.Project

  def project do
    [app: :reivax_http,
     version: "0.0.1",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {ReivaxHttp, []},
     applications: [:phoenix, :phoenix_html, :phoenix_ecto, :cowboy, :logger,
                    :postgrex, :reivax]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.13"},
     {:phoenix_html, "~> 1.0"},
     {:phoenix_ecto, "~> 0.3"},
     {:phoenix_live_reload, "~> 0.4", only: :dev},
     {:postgrex, ">= 0.0.0"},
     {:cowboy, "~> 1.0"},
     {:reivax, in_umbrella: true}
   ]
  end
end
