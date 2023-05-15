defmodule BizkaimovesApiWeb.StopController do
  use BizkaimovesApiWeb, :controller

  alias BizkaimovesApi.Bizkaibus
  alias BizkaimovesApi.Bizkaibus.Stop

  action_fallback BizkaimovesApiWeb.FallbackController

  def index(conn, _params) do
    stops = Bizkaibus.list_stops()
    render(conn, :index, stops: stops)
  end

  def create(conn, %{"stop" => stop_params}) do
    with {:ok, %Stop{} = stop} <- Bizkaibus.create_stop(stop_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/stops/#{stop}")
      |> render(:show, stop: stop)
    end
  end

  def show(conn, %{"id" => id}) do
    stop = Bizkaibus.get_stop!(id)
    render(conn, :show, stop: stop)
  end

  def update(conn, %{"id" => id, "stop" => stop_params}) do
    stop = Bizkaibus.get_stop!(id)

    with {:ok, %Stop{} = stop} <- Bizkaibus.update_stop(stop, stop_params) do
      render(conn, :show, stop: stop)
    end
  end

  def delete(conn, %{"id" => id}) do
    stop = Bizkaibus.get_stop!(id)

    with {:ok, %Stop{}} <- Bizkaibus.delete_stop(stop) do
      send_resp(conn, :no_content, "")
    end
  end
end
