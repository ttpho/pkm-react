defmodule PkmManager.Repo.Migrations.CreatePokemons do
  use Ecto.Migration

  def change do
    create table(:pokemons) do
      add :name, :string
      add :national_number, :string
      add :url_link, :string
      add :url_image, :string
      add :gen, :string

      timestamps()
    end

  end
end
