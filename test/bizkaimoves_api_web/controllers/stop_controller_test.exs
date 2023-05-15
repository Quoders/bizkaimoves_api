defmodule BizkaimovesApiWeb.StopControllerTest do
  use BizkaimovesApiWeb.ConnCase

  import BizkaimovesApi.BizkaibusFixtures

  alias BizkaimovesApi.Bizkaibus.Stop

  @create_attrs %{
    stop_code: "some stop_code",
    stop_id: "some stop_id",
    stop_name: "some stop_name"
  }
  @update_attrs %{
    stop_code: "some updated stop_code",
    stop_id: "some updated stop_id",
    stop_name: "some updated stop_name"
  }
  @invalid_attrs %{stop_code: nil, stop_id: nil, stop_name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stops", %{conn: conn} do
      conn = get(conn, ~p"/api/stops")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stop" do
    test "renders stop when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/stops", stop: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/stops/#{id}")

      assert %{
               "id" => ^id,
               "stop_code" => "some stop_code",
               "stop_id" => "some stop_id",
               "stop_name" => "some stop_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/stops", stop: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stop" do
    setup [:create_stop]

    test "renders stop when data is valid", %{conn: conn, stop: %Stop{id: id} = stop} do
      conn = put(conn, ~p"/api/stops/#{stop}", stop: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/stops/#{id}")

      assert %{
               "id" => ^id,
               "stop_code" => "some updated stop_code",
               "stop_id" => "some updated stop_id",
               "stop_name" => "some updated stop_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, stop: stop} do
      conn = put(conn, ~p"/api/stops/#{stop}", stop: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stop" do
    setup [:create_stop]

    test "deletes chosen stop", %{conn: conn, stop: stop} do
      conn = delete(conn, ~p"/api/stops/#{stop}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/stops/#{stop}")
      end
    end
  end

  defp create_stop(_) do
    stop = stop_fixture()
    %{stop: stop}
  end
end
