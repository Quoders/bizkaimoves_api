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
end
