defmodule RedisExample do
  @moduledoc """
  Documentation for RedisExample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RedisExample.hello()
      :world

  """
  def hello do
    :world
  end

  def redis_server do
    RedisExample.Store.start_link(%{})
    RedisExample.Server.accept(4040)
  end
end
