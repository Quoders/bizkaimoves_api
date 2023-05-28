defmodule BizkaimovesApiWeb.RouteControllerTest do
  use BizkaimovesApiWeb.ConnCase

  import BizkaimovesApi.BizkaibusFixtures

  alias BizkaimovesApi.Bizkaibus.Route

  @create_attrs %{
    route_desc: "some route_desc",
    route_id: "some route_id",
    route_short_name: "some route_short_name",
    route_sort_order: 42,
    route_url: "some route_url"
  }
  @update_attrs %{
    route_desc: "some updated route_desc",
    route_id: "some updated route_id",
    route_short_name: "some updated route_short_name",
    route_sort_order: 43,
    route_url: "some updated route_url"
  }
  @invalid_attrs %{route_desc: nil, route_id: nil, route_short_name: nil, route_sort_order: nil, route_url: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all routes", %{conn: conn} do
      conn = get(conn, ~p"/api/routes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create route" do
    test "renders route when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/routes", route: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/routes/#{id}")

      assert %{
               "id" => ^id,
               "route_desc" => "some route_desc",
               "route_id" => "some route_id",
               "route_short_name" => "some route_short_name",
               "route_sort_order" => 42,
               "route_url" => "some route_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/routes", route: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update route" do
    setup [:create_route]

    test "renders route when data is valid", %{conn: conn, route: %Route{id: id} = route} do
      conn = put(conn, ~p"/api/routes/#{route}", route: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/routes/#{id}")

      assert %{
               "id" => ^id,
               "route_desc" => "some updated route_desc",
               "route_id" => "some updated route_id",
               "route_short_name" => "some updated route_short_name",
               "route_sort_order" => 43,
               "route_url" => "some updated route_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, route: route} do
      conn = put(conn, ~p"/api/routes/#{route}", route: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete route" do
    setup [:create_route]

    test "deletes chosen route", %{conn: conn, route: route} do
      conn = delete(conn, ~p"/api/routes/#{route}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/routes/#{route}")
      end
    end
  end

  defp create_route(_) do
    route = route_fixture()
    %{route: route}
  end
end
