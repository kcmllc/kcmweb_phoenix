defmodule KcmwebPhoenix.Mixfile do
  use Mix.Project

  def project do
    [app: :kcmweb_phoenix,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {KcmwebPhoenix, []},
     applications: [:phoenix, :cowboy, :logger, :ecto, :postgrex, :httpoison, :json, :exjsx]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "0.5.0"},
     {:cowboy, "~> 1.0"},
     {:ecto, "~> 0.2.5"},
     {:postgrex, "~> 0.6.0"},
     {:httpoison, "~> 0.5"},
     {:json, "~> 0.3.0"},
     {:exjsx, "~> 3.0.0"}]
  end
end
