defmodule RedisExample.Processes do
  def process({:set, ["SET" | [key | value]]}, socket) do
    RedisExample.Store.set(key, value)
    :gen_tcp.send(socket, "OK\n")
  end

  def process({:get, ["GET" | key]}, socket) do
    data = RedisExample.Store.get(key)
    :gen_tcp.send(socket, "#{data}\n")
  end

  def process({:del, ["DEL" | key]}, socket) do
    RedisExample.Store.del(key)
    :gen_tcp.send(socket, "(nil)\n")
  end

  def process({:flushdb}, socket) do
    RedisExample.Store.flushdb()
    :gen_tcp.send(socket, "OK\n")
  end

  def process({:stop}, socket) do
    RedisExample.Store.stop()
    :gen_tcp.send(socket, "STOP\n")
  end

  def process({:nothing, message}, socket), do: :gen_tcp.send(socket, "#{message}\n")
end
