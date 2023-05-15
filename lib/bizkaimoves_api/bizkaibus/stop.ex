defmodule BizkaimovesApi.Bizkaibus.Stop do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "stops" do
    field :stop_code, :string
    field :stop_id, :string
    field :stop_name, :string

    timestamps()
  end

  @doc false
  def changeset(stop, attrs) do
    stop
    |> cast(attrs, [:stop_id, :stop_code, :stop_name])
    |> validate_required([:stop_id, :stop_code, :stop_name])
  end
end
