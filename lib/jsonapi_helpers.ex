defmodule JsonapiHelpers do
  alias JsonapiHelpers.MapHelpers

  def jsonapi_id(%{"data" => data}) do
    data
    |> MapHelpers.stringify_keys()
    |> get_in(["id"])
  end

  def jsonapi_id(data), do: jsonapi_id(%{"data" => data})

  def jsonapi_type(%{"data" => data}) do
    data
    |> MapHelpers.stringify_keys()
    |> get_in(["type"])
  end

  def jsonapi_type(data), do: jsonapi_type(%{"data" => data})

  def jsonapi_attributes(%{"data" => data}) do
    data
    |> MapHelpers.stringify_keys()
    |> Map.get("attributes", %{})
    |> Map.keys()
  end

  def jsonapi_attributes(data), do: jsonapi_attributes(%{"data" => data})

  def jsonapi_attribute_value(%{"data" => data}, attribute) do
    data
    |> MapHelpers.stringify_keys()
    |> Map.get("attributes", %{})
    |> Map.get(attribute)
  end

  def jsonapi_attribute_value(data, attribute),
    do: jsonapi_attribute_value(%{"data" => data}, attribute)

  def jsonapi_relationships(%{"data" => data}) do
    data
    |> MapHelpers.stringify_keys()
    |> Map.get("relationships", %{})
    |> Map.keys()
  end

  def jsonapi_relationships(data), do: jsonapi_relationships(%{"data" => data})

  def jsonapi_relationship_data(%{"data" => data}, attribute) do
    data
    |> MapHelpers.stringify_keys()
    |> Map.get("relationships", %{})
    |> Map.get(attribute, %{})
    |> Map.get("data")
  end

  def jsonapi_relationship_data(data, attribute),
    do: jsonapi_relationship_data(%{"data" => data}, attribute)
end
