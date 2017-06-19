defmodule Learn do
  @moduledoc """
  Documentation for Learn.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Learn.hello
      :world

  """
  def hello do
    :world
    handle_open = fn
      {:ok, file} -> "Read data: #{IO.read(file, :line)}"
      {_, error} -> "Error: #{:file.format_error(error)}"
    end
    handle_open.(File.open("../test/learn_test.exs"))
  end

  
end
