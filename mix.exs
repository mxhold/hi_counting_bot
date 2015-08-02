defmodule HiCountingBot.Mixfile do
  use Mix.Project

  def project do
    [app: :hicountingbot,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :slack]]
  end

  defp deps do
    [
      {:slack, "~> 0.2.0"},
      {:websocket_client, github: "jeremyong/websocket_client"},
      {:mock, "~> 0.1.1"},
    ]
  end
end
