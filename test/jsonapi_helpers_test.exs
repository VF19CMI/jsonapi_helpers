defmodule JsonapiHelpersTest do
  use ExUnit.Case
  import JsonapiHelpers

  setup do
    params = %{
      "data" => %{
        "id" => "10",
        "type" => "users",
        "attributes" => %{
          "email" => "jon@snow.com",
          "name" => "Jon Snow",
          "date" => ~N[2000-01-01 00:00:00]
        },
        "relationships" => %{
          "comments" => %{"data" => [%{"id" => "10", "type" => "comments"}]},
          "posts" => %{"data" => [%{"id" => "1", "type" => "posts"}]}
        }
      }
    }

    [
      params: params,
      params_without_data: params["data"]
    ]
  end

  test "jsonapi_id", %{params: params} do
    assert jsonapi_id(params) == "10"
  end

  test "jsonapi_type", %{params: params} do
    assert jsonapi_type(params) == "users"
  end

  test "jsonapi_attributes", %{params: params} do
    assert jsonapi_attributes(params) == ~w(date email name)
  end

  test "jsonapi_attribute_value", %{params: params} do
    assert jsonapi_attribute_value(params, "name") == "Jon Snow"
    assert jsonapi_attribute_value(params, "email") == "jon@snow.com"
    assert jsonapi_attribute_value(params, "date") == ~N[2000-01-01 00:00:00]
  end

  test "jsonapi_relationships", %{params: params} do
    assert jsonapi_relationships(params) == ~w(comments posts)
  end

  test "jsonapi_relationship_data", %{params: params} do
    expected = [%{"id" => "10", "type" => "comments"}]
    assert jsonapi_relationship_data(params, "comments") == expected
  end

  describe "with missing data" do
    test "jsonapi_id", %{params_without_data: params_without_data} do
      assert jsonapi_id(params_without_data) == "10"
    end

    test "jsonapi_type", %{params_without_data: params_without_data} do
      assert jsonapi_type(params_without_data) == "users"
    end

    test "jsonapi_attributes", %{params_without_data: params_without_data} do
      assert jsonapi_attributes(params_without_data) == ~w(date email name)
    end

    test "jsonapi_attribute_value", %{params_without_data: params_without_data} do
      assert jsonapi_attribute_value(params_without_data, "name") == "Jon Snow"
      assert jsonapi_attribute_value(params_without_data, "email") == "jon@snow.com"
      assert jsonapi_attribute_value(params_without_data, "date") == ~N[2000-01-01 00:00:00]
    end

    test "jsonapi_relationships", %{params_without_data: params_without_data} do
      assert jsonapi_relationships(params_without_data) == ~w(comments posts)
    end

    test "jsonapi_relationship_data", %{params_without_data: params_without_data} do
      expected = [%{"id" => "10", "type" => "comments"}]
      assert jsonapi_relationship_data(params_without_data, "comments") == expected
    end
  end
end
