import Config

config :libcluster,
  topologies: [
    topology: [
      strategy: Cluster.Strategy.Kubernetes.DNS,
      config: [
        service: "elixir-cluster-demo",
        application_name: "elixir_cluster_demo",
      ]
    ]
  ]

config :swarm,
  node_whitelist: [~r/^elixir_cluster_demo@.*$/]
