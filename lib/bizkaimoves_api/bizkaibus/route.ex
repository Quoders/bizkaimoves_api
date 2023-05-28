defmodule BizkaimovesApi.Bizkaibus.Route do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "routes" do
    field :route_desc, :string
    field :route_id, :string
    field :route_short_name, :string
    field :route_sort_order, :integer
    field :route_url, :string

    timestamps()
  end

  @doc false
  def changeset(route, attrs) do
    route
    |> cast(attrs, [:route_id, :route_short_name, :route_desc, :route_url, :route_sort_order])
    |> validate_required([:route_id, :route_short_name, :route_desc, :route_url, :route_sort_order])
  end
end
