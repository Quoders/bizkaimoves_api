defmodule BizkaimovesApiWeb.StopJSON do
  alias BizkaimovesApi.Bizkaibus.Stop

  @doc """
  Renders a list of stops.
  """
  def index(%{stops: stops}) do
    %{data: for(stop <- stops, do: data(stop))}
  end

  @doc """
  Renders a single stop.
  """
  def show(%{stop: stop}) do
    %{data: data(stop)}
  end

  defp data(%Stop{} = stop) do
    %{
      id: stop.id,
      stop_id: stop.stop_id,
      stop_code: stop.stop_code,
      stop_name: stop.stop_name,
      stop_loc: stop.stop_loc
    }
  end
end
