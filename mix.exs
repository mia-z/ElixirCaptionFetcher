defmodule YtFetcher.MixProject do
  use Mix.Project

  def project do
    [
      app: :ytfetcher,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {YtFetcher.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.5"},
      {:jason, "~> 1.3"},
      {:json, "~> 1.4.1"},
      {:httpoison, "~> 1.8"},
      {:sweet_xml, "~> 0.7.1"}
    ]
  end
end
