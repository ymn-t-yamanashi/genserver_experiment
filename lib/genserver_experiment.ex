defmodule GenserverExperiment do
  @moduledoc """
  Documentation for `GenserverExperiment`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GenserverExperiment.hello()
      :world

  """
  def hello do
    Worker.start_link(:ymn)
    Worker.set(:ymn, "hoge")

    Worker.get(:ymn)
    |> IO.inspect()

    Worker.start_link(:y)
    Worker.set(:y, "fuga")

    Worker.get(:y)
    |> IO.inspect()

    Task.async(fn -> Worker.get(:ymn) end)
    |> Task.await()
    |> IO.inspect()

    hoge()

    :world
  end

  def hoge() do
    Worker.get(:ymn)
    |> IO.inspect()
  end
end
