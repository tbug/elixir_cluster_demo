defmodule ElixirClusterDemo.Counter do
    use Agent

    def start_link(name, val) do
        Agent.start_link(fn -> val end, name: via_swarm(name))
    end

    def value(name) do
        Agent.get(via_swarm(name), &(&1))
    end

    def increment(name) do
        Agent.update(via_swarm(name), &(&1 + 1))
    end

    defp via_swarm(name) do
        {:via, :swarm, name}
    end
end
