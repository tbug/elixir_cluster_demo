defmodule ElixirClusterDemo.MixProject do
  use Mix.Project
  def project do
    [
      app: :elixir_cluster_demo,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end
  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirClusterDemo.Application, []}
    ]
  end
  defp deps do
    [
      {:libcluster, "~> 3.1"},
      {:swarm, "~> 3.0"},
    ]
  end
end
