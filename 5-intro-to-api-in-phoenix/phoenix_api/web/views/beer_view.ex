defmodule PhoenixApi.BeerView do
  use PhoenixApi.Web, :view

  def render("index.json", %{beers: beers}) do
    %{data: render_many(beers, PhoenixApi.BeerView, "beer.json")}
  end

  def render("show.json", %{beer: beer}) do
    %{data: render_one(beer, PhoenixApi.BeerView, "beer.json")}
  end

  def render("beer.json", %{beer: beer}) do
    %{id: beer.id,
      name: beer.name,
      type: beer.type,
      alchohol_volume: beer.alchohol_volume}
  end
end
