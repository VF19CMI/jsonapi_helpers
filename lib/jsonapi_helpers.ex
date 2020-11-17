defmodule JsonapiHelpers do
  alias JsonapiHelpers.MapHelpers

  defmacro jsonapi_id(data) do
    quote do
      unquote(data)
      |> MapHelpers.stringify_keys()
      |> get_in(["data", "id"])
    end
  end

  defmacro jsonapi_type(data) do
    quote do
      unquote(data)
      |> MapHelpers.stringify_keys()
      |> get_in(["data", "type"])
    end
  end

  defmacro jsonapi_attributes(data) do
    quote do
      unquote(data)
      |> MapHelpers.stringify_keys()
      |> Map.get("data", %{})
      |> Map.get("attributes", %{})
      |> Map.keys()
    end
  end

  defmacro jsonapi_attribute_value(data, attribute) do
    quote do
      unquote(data)
      |> MapHelpers.stringify_keys()
      |> Map.get("data", %{})
      |> Map.get("attributes", %{})
      |> Map.get(unquote(attribute))
    end
  end

  defmacro jsonapi_relationships(data) do
    quote do
      unquote(data)
      |> MapHelpers.stringify_keys()
      |> Map.get("data", %{})
      |> Map.get("relationships", %{})
      |> Map.keys()
    end
  end

  defmacro jsonapi_relationship_data(data, attribute) do
    quote do
      unquote(data)
      |> MapHelpers.stringify_keys()
      |> Map.get("data", %{})
      |> Map.get("relationships", %{})
      |> Map.get(unquote(attribute), %{})
      |> Map.get("data")
    end
  end
end
