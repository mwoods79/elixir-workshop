defmodule PhoenixApi.BeerControllerTest do
  use PhoenixApi.ConnCase

  alias PhoenixApi.Beer
  @valid_attrs %{alchohol_volume: "some content", name: "some content", type: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, beer_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = get conn, beer_path(conn, :show, beer)
    assert json_response(conn, 200)["data"] == %{"id" => beer.id,
      "name" => beer.name,
      "type" => beer.type,
      "alchohol_volume" => beer.alchohol_volume}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, beer_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, beer_path(conn, :create), beer: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Beer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, beer_path(conn, :create), beer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = put conn, beer_path(conn, :update, beer), beer: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Beer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = put conn, beer_path(conn, :update, beer), beer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    beer = Repo.insert! %Beer{}
    conn = delete conn, beer_path(conn, :delete, beer)
    assert response(conn, 204)
    refute Repo.get(Beer, beer.id)
  end
end
