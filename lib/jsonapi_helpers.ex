defmodule JsonapiHelpers do
  alias JsonapiHelpers.MapHelpers

  def jsonapi_id(data) do
    data
    |> MapHelpers.stringify_keys()
    |> get_in(["data", "id"])
  end

  def jsonapi_type(data) do
    data
    |> MapHelpers.stringify_keys()
    |> get_in(["data", "type"])
  end

  def jsonapi_attributes(data) do
    data
    |> MapHelpers.stringify_keys()
    |> Map.get("data", %{})
    |> Map.get("attributes", %{})
    |> Map.keys()
  end

  def jsonapi_attribute_value(data, attribute) do
    data
    |> MapHelpers.stringify_keys()
    |> Map.get("data", %{})
    |> Map.get("attributes", %{})
    |> Map.get(attribute)
  end

  def jsonapi_relationships(data) do
    data
    |> MapHelpers.stringify_keys()
    |> Map.get("data", %{})
    |> Map.get("relationships", %{})
    |> Map.keys()
  end

  def jsonapi_relationship_data(data, attribute) do
    data
    |> MapHelpers.stringify_keys()
    |> Map.get("data", %{})
    |> Map.get("relationships", %{})
    |> Map.get(attribute, %{})
    |> Map.get("data")
  end
end
