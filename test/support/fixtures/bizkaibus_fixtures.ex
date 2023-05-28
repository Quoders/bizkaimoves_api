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

  @doc """
  Generate a route.
  """
  def route_fixture(attrs \\ %{}) do
    {:ok, route} =
      attrs
      |> Enum.into(%{
        route_desc: "some route_desc",
        route_id: "some route_id",
        route_short_name: "some route_short_name",
        route_sort_order: 42,
        route_url: "some route_url"
      })
      |> BizkaimovesApi.Bizkaibus.create_route()

    route
  end
end
