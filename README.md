## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `jsonapi_helpers` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:jsonapi_helpers, "~> 0.1.0", only: :test}
  ]
end
```

## Usage

```elixir
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

  test "params", %{params: params} do
    assert jsonapi_id(params) == "10"
    assert jsonapi_type(params) == "users"

    assert jsonapi_attributes(params) == ~w(email name)
    assert jsonapi_attribute_value(params, "name") == "Jon Snow"
    assert jsonapi_attribute_value(params, "email") == "jon@snow.com"

    assert jsonapi_relationships(params) == ~w(comments posts)
    assert jsonapi_relationship_data(params, "comments") == [%{"id" => "10", "type" => "comments"}]
  end
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/jsonapi_helpers](https://hexdocs.pm/jsonapi_helpers).

