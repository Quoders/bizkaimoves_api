defmodule BizkaimovesApi.BizkaibusFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BizkaimovesApi.Bizkaibus` context.
  """

  @doc """
  Generate a stop.
  """
  def stop_fixture(attrs \\ %{}) do
    {:ok, stop} =
      attrs
      |> Enum.into(%{
        stop_code: "some stop_code",
        stop_id: "some stop_id",
        stop_name: "some stop_name"
      })
      |> BizkaimovesApi.Bizkaibus.create_stop()

    stop
  end
end
