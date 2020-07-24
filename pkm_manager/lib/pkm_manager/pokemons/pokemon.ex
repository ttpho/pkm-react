defmodule PkmManager.Pokemons.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pokemons" do
    field :gen, :string
    field :name, :string
    field :national_number, :string
    field :urls, :string

    timestamps()
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:name, :national_number, :urls, :gen])
    |> validate_required([:name, :national_number, :urls, :gen])
  end
end
