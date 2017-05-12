defmodule PhoenixApi.Repo.Migrations.CreateBeer do
  use Ecto.Migration

  def change do
    create table(:beers) do
      add :name, :string
      add :type, :string
      add :alchohol_volume, :string

      timestamps()
    end

  end
end
