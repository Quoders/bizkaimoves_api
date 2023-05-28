defmodule BizkaimovesApiWeb.RouteJSON do
  alias BizkaimovesApi.Bizkaibus.Route

  @doc """
  Renders a list of routes.
  """
  def index(%{routes: routes}) do
    %{data: for(route <- routes, do: data(route))}
  end

  @doc """
  Renders a single route.
  """
  def show(%{route: route}) do
    %{data: data(route)}
  end

  defp data(%Route{} = route) do
    %{
      id: route.id,
      route_id: route.route_id,
      route_short_name: route.route_short_name,
      route_desc: route.route_desc,
      route_url: route.route_url,
      route_sort_order: route.route_sort_order
    }
  end
end
