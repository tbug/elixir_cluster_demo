defmodule ElixirClusterDemoTest do
  use ExUnit.Case
  doctest ElixirClusterDemo

  test "greets the world" do
    assert ElixirClusterDemo.hello() == :world
  end
end
