defmodule BizkaimovesApiWeb.RouteController do
  use BizkaimovesApiWeb, :controller

  alias BizkaimovesApi.Bizkaibus
  alias BizkaimovesApi.Bizkaibus.Route

  action_fallback BizkaimovesApiWeb.FallbackController

  def index(conn, _params) do
    routes = Bizkaibus.list_routes()
    render(conn, :index, routes: routes)
  end

  def create(conn, %{"route" => route_params}) do
    with {:ok, %Route{} = route} <- Bizkaibus.create_route(route_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/routes/#{route}")
      |> render(:show, route: route)
    end
  end

  def show(conn, %{"id" => id}) do
    route = Bizkaibus.get_route!(id)
    render(conn, :show, route: route)
  end

  def update(conn, %{"id" => id, "route" => route_params}) do
    route = Bizkaibus.get_route!(id)

    with {:ok, %Route{} = route} <- Bizkaibus.update_route(route, route_params) do
      render(conn, :show, route: route)
    end
  end

  def delete(conn, %{"id" => id}) do
    route = Bizkaibus.get_route!(id)

    with {:ok, %Route{}} <- Bizkaibus.delete_route(route) do
      send_resp(conn, :no_content, "")
    end
  end
end
