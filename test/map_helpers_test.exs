defmodule JsonapiHelpers.MapHelpersTest do
  use ExUnit.Case
  alias JsonapiHelpers.MapHelpers

  setup do
    [
      params: %{
        data: %{
          "id" => "1",
          "types" => "users",
          "attributes" => %{
            roles: ["admin"]
          }
        }
      }
    ]
  end

  test "stringify_keys", %{params: params} do
    expected = %{
      "data" => %{
        "id" => "1",
        "types" => "users",
        "attributes" => %{
          "roles" => ["admin"]
        }
      }
    }

    assert MapHelpers.stringify_keys(params) == expected
  end
end
