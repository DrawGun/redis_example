defmodule Mix.Tasks.Dredis do
  use Mix.Task

  @shortdoc "Просто вызывает функцию RedisExample.redis_server/0."
  def run(_) do
    RedisExample.redis_server()
  end
end
