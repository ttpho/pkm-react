defmodule PkmManager.Pokemons.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pokemons" do
    field :gen, :string
    field :name, :string
    field :national_number, :string
    field :url_image, :string
    field :url_link, :string

    timestamps()
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:name, :national_number, :url_link, :url_image, :gen])
    |> validate_required([:name, :national_number, :url_link, :url_image, :gen])
  end
end
