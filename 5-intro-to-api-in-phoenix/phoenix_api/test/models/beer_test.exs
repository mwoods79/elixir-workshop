defmodule PhoenixApi.BeerTest do
  use PhoenixApi.ModelCase

  alias PhoenixApi.Beer

  @valid_attrs %{alchohol_volume: "some content", name: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Beer.changeset(%Beer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Beer.changeset(%Beer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
