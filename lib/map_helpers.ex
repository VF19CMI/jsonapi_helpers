defmodule JsonapiHelpers.MapHelpers do
  def stringify_keys(nil), do: nil

  def stringify_keys(%{__struct__: NaiveDateTime} = value), do: value

  def stringify_keys(data) when is_map(data) do
    data
    |> Enum.map(fn {k, v} -> {key_to_string(k), stringify_keys(v)} end)
    |> Enum.into(%{})
  end

  def stringify_keys([head | rest]) do
    [stringify_keys(head) | stringify_keys(rest)]
  end

  def stringify_keys(not_a_map) do
    not_a_map
  end

  defp key_to_string(key) when is_atom(key), do: Atom.to_string(key)
  defp key_to_string(key) when is_binary(key), do: key
end
