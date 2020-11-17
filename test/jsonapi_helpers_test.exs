defmodule JsonapiHelpersTest do
  use ExUnit.Case
  import JsonapiHelpers

  setup do
    [
      params: %{
        "data" => %{
          "id" => "10",
          "type" => "users",
          "attributes" => %{
            "email" => "jon@snow.com",
            "name" => "Jon Snow"
          },
          "relationships" => %{
            "comments" => %{"data" => [%{"id" => "10", "type" => "comments"}]},
            "posts" => %{"data" => [%{"id" => "1", "type" => "posts"}]}
          }
        }
      }
    ]
  end

  test "jsonapi_id", %{params: params} do
    assert jsonapi_id(params) == "10"
  end

  test "jsonapi_type", %{params: params} do
    assert jsonapi_type(params) == "users"
  end

  test "jsonapi_attributes", %{params: params} do
    assert jsonapi_attributes(params) == ~w(email name)
  end

  test "jsonapi_attribute_value", %{params: params} do
    assert jsonapi_attribute_value(params, "name") == "Jon Snow"
    assert jsonapi_attribute_value(params, "email") == "jon@snow.com"
  end

  test "jsonapi_relationships", %{params: params} do
    assert jsonapi_relationships(params) == ~w(comments posts)
  end

  test "jsonapi_relationship_data", %{params: params} do
    expected = [%{"id" => "10", "type" => "comments"}]
    assert jsonapi_relationship_data(params, "comments") == expected
  end
end
