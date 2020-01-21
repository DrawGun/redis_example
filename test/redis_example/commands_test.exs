defmodule RedisExample.CommandsTest do
  use ExUnit.Case

  test "SET command" do
    command = "SET key1 11221"
    assert RedisExample.Commands.match_to_command(command) == {:set, ["SET", "key1", "11221"]}
  end

  test "GET command" do
    command = "GET key1"
    assert RedisExample.Commands.match_to_command(command) == {:get, ["GET", "key1"]}
  end

  test "DEL command" do
    command = "DEL key1"
    assert RedisExample.Commands.match_to_command(command) == {:del, ["DEL", "key1"]}
  end

  test "FLUSHDB command" do
    command = "FLUSHDB"
    assert RedisExample.Commands.match_to_command(command) == {:flushdb}
  end

  test "stop command" do
    command = "stop"
    assert RedisExample.Commands.match_to_command(command) == {:stop}
  end

  test "wrong command" do
    command = "che to tam nakalyakal"

    assert RedisExample.Commands.match_to_command(command) ==
             {:nothing, "Wrong command #{command}"}
  end
end
