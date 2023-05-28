defmodule BizkaimovesApi.BizkaibusTest do
  use BizkaimovesApi.DataCase

  alias BizkaimovesApi.Bizkaibus

  describe "stops" do
    alias BizkaimovesApi.Bizkaibus.Stop

    import BizkaimovesApi.BizkaibusFixtures

    @invalid_attrs %{stop_code: nil, stop_id: nil, stop_name: nil}

    test "list_stops/0 returns all stops" do
      stop = stop_fixture()
      assert Bizkaibus.list_stops() == [stop]
    end

    test "get_stop!/1 returns the stop with given id" do
      stop = stop_fixture()
      assert Bizkaibus.get_stop!(stop.id) == stop
    end

    test "create_stop/1 with valid data creates a stop" do
      valid_attrs = %{stop_code: "some stop_code", stop_id: "some stop_id", stop_name: "some stop_name"}

      assert {:ok, %Stop{} = stop} = Bizkaibus.create_stop(valid_attrs)
      assert stop.stop_code == "some stop_code"
      assert stop.stop_id == "some stop_id"
      assert stop.stop_name == "some stop_name"
    end

    test "create_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bizkaibus.create_stop(@invalid_attrs)
    end

    test "update_stop/2 with valid data updates the stop" do
      stop = stop_fixture()
      update_attrs = %{stop_code: "some updated stop_code", stop_id: "some updated stop_id", stop_name: "some updated stop_name"}

      assert {:ok, %Stop{} = stop} = Bizkaibus.update_stop(stop, update_attrs)
      assert stop.stop_code == "some updated stop_code"
      assert stop.stop_id == "some updated stop_id"
      assert stop.stop_name == "some updated stop_name"
    end

    test "update_stop/2 with invalid data returns error changeset" do
      stop = stop_fixture()
      assert {:error, %Ecto.Changeset{}} = Bizkaibus.update_stop(stop, @invalid_attrs)
      assert stop == Bizkaibus.get_stop!(stop.id)
    end

    test "delete_stop/1 deletes the stop" do
      stop = stop_fixture()
      assert {:ok, %Stop{}} = Bizkaibus.delete_stop(stop)
      assert_raise Ecto.NoResultsError, fn -> Bizkaibus.get_stop!(stop.id) end
    end

    test "change_stop/1 returns a stop changeset" do
      stop = stop_fixture()
      assert %Ecto.Changeset{} = Bizkaibus.change_stop(stop)
    end
  end

  describe "routes" do
    alias BizkaimovesApi.Bizkaibus.Route

    import BizkaimovesApi.BizkaibusFixtures

    @invalid_attrs %{route_desc: nil, route_id: nil, route_short_name: nil, route_sort_order: nil, route_url: nil}

    test "list_routes/0 returns all routes" do
      route = route_fixture()
      assert Bizkaibus.list_routes() == [route]
    end

    test "get_route!/1 returns the route with given id" do
      route = route_fixture()
      assert Bizkaibus.get_route!(route.id) == route
    end

    test "create_route/1 with valid data creates a route" do
      valid_attrs = %{route_desc: "some route_desc", route_id: "some route_id", route_short_name: "some route_short_name", route_sort_order: 42, route_url: "some route_url"}

      assert {:ok, %Route{} = route} = Bizkaibus.create_route(valid_attrs)
      assert route.route_desc == "some route_desc"
      assert route.route_id == "some route_id"
      assert route.route_short_name == "some route_short_name"
      assert route.route_sort_order == 42
      assert route.route_url == "some route_url"
    end

    test "create_route/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bizkaibus.create_route(@invalid_attrs)
    end

    test "update_route/2 with valid data updates the route" do
      route = route_fixture()
      update_attrs = %{route_desc: "some updated route_desc", route_id: "some updated route_id", route_short_name: "some updated route_short_name", route_sort_order: 43, route_url: "some updated route_url"}

      assert {:ok, %Route{} = route} = Bizkaibus.update_route(route, update_attrs)
      assert route.route_desc == "some updated route_desc"
      assert route.route_id == "some updated route_id"
      assert route.route_short_name == "some updated route_short_name"
      assert route.route_sort_order == 43
      assert route.route_url == "some updated route_url"
    end

    test "update_route/2 with invalid data returns error changeset" do
      route = route_fixture()
      assert {:error, %Ecto.Changeset{}} = Bizkaibus.update_route(route, @invalid_attrs)
      assert route == Bizkaibus.get_route!(route.id)
    end

    test "delete_route/1 deletes the route" do
      route = route_fixture()
      assert {:ok, %Route{}} = Bizkaibus.delete_route(route)
      assert_raise Ecto.NoResultsError, fn -> Bizkaibus.get_route!(route.id) end
    end

    test "change_route/1 returns a route changeset" do
      route = route_fixture()
      assert %Ecto.Changeset{} = Bizkaibus.change_route(route)
    end
  end
end
