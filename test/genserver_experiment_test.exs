defmodule GenserverExperimentTest do
  use ExUnit.Case
  doctest GenserverExperiment

  test "greets the world" do
    assert GenserverExperiment.hello() == :world
  end
end
