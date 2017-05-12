defmodule PhoenixApi.Beer do
  use PhoenixApi.Web, :model

  schema "beers" do
    field :name, :string
    field :type, :string
    field :alchohol_volume, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :type, :alchohol_volume])
    |> validate_required([:name, :type, :alchohol_volume])
  end
end
