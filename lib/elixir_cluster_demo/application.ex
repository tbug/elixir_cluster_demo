defmodule ElixirClusterDemo.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Cluster.Supervisor, [
        Application.get_env(:libcluster, :topologies),
        [name: ElixirClusterDemo.ClusterSupervisor]
      ]},
      # ... your own children here
    ]
    Supervisor.start_link(children, strategy: :one_for_one, name: ElixirClusterDemo.Supervisor)
  end
end
