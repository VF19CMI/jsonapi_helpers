defmodule JsonapiHelpers do
  alias JsonapiHelpers.MapHelpers

  def jsonapi_id(data) do
    dig(data, ["data", "id"]) || dig(data, ["id"])
  end

  def jsonapi_type(data) do
    dig(data, ["data", "type"]) || dig(data, ["type"])
  end

  def jsonapi_attributes(data) do
    Map.keys(dig(data, ["data", "attributes"]) || dig(data, ["attributes"]) || %{})
  end

  def jsonapi_attribute_value(data, attribute) do
    (dig(data, ["data", "attributes"]) || dig(data, ["attributes"]) || %{})
    |> Map.get(attribute)
  end

  def jsonapi_relationships(data) do
    (dig(data, ["data", "relationships"]) || dig(data, ["relationships"]) || %{})
    |> Map.keys()
  end

  def jsonapi_relationship_data(data, attribute) do
    dig(data, ["data", "relationships", attribute, "data"]) || dig(data, ["relationships", attribute, "data"])
  end

  defp dig(data, dig) do
    data
    |> MapHelpers.stringify_keys()
    |> get_in(dig)
  end
end
