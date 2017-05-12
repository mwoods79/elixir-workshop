defmodule PhoenixApi.BeerController do
  use PhoenixApi.Web, :controller

  alias PhoenixApi.Beer

  def index(conn, _params) do
    beers = Repo.all(Beer)
    render(conn, "index.json", beers: beers)
  end

  def create(conn, %{"beer" => beer_params}) do
    changeset = Beer.changeset(%Beer{}, beer_params)

    case Repo.insert(changeset) do
      {:ok, beer} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", beer_path(conn, :show, beer))
        |> render("show.json", beer: beer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    beer = Repo.get!(Beer, id)
    render(conn, "show.json", beer: beer)
  end

  def update(conn, %{"id" => id, "beer" => beer_params}) do
    beer = Repo.get!(Beer, id)
    changeset = Beer.changeset(beer, beer_params)

    case Repo.update(changeset) do
      {:ok, beer} ->
        render(conn, "show.json", beer: beer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    beer = Repo.get!(Beer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(beer)

    send_resp(conn, :no_content, "")
  end
end
