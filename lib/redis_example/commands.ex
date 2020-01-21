defmodule RedisExample.Commands do
  def match_to_command(command) do
    splitted_command =
      command
      |> String.split()

    first_arg =
      splitted_command
      |> List.first()

    case first_arg do
      "SET" ->
        {:set, splitted_command}

      "GET" ->
        {:get, splitted_command}

      "DEL" ->
        {:del, splitted_command}

      "FLUSHDB" ->
        {:flushdb}

      "stop" ->
        {:stop}

      _ ->
        {:nothing, "Wrong command #{command}"}
    end
  end
end
