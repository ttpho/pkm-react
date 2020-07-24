defmodule PkmManagerWeb.PokemonController do
  use PkmManagerWeb, :controller

  alias PkmManager.Pokemons
  alias PkmManager.Pokemons.Pokemon

  def index(conn, _params) do
    pokemons = Pokemons.list_pokemons()
    render(conn, "index.html", pokemons: pokemons)
  end

  def new(conn, _params) do
    changeset = Pokemons.change_pokemon(%Pokemon{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pokemon" => pokemon_params}) do
    case Pokemons.create_pokemon(pokemon_params) do
      {:ok, pokemon} ->
        conn
        |> put_flash(:info, "Pokemon created successfully.")
        |> redirect(to: Routes.pokemon_path(conn, :show, pokemon))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pokemon = Pokemons.get_pokemon!(id)
    render(conn, "show.html", pokemon: pokemon)
  end

  def edit(conn, %{"id" => id}) do
    pokemon = Pokemons.get_pokemon!(id)
    changeset = Pokemons.change_pokemon(pokemon)
    render(conn, "edit.html", pokemon: pokemon, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pokemon" => pokemon_params}) do
    pokemon = Pokemons.get_pokemon!(id)

    case Pokemons.update_pokemon(pokemon, pokemon_params) do
      {:ok, pokemon} ->
        conn
        |> put_flash(:info, "Pokemon updated successfully.")
        |> redirect(to: Routes.pokemon_path(conn, :show, pokemon))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pokemon: pokemon, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pokemon = Pokemons.get_pokemon!(id)
    {:ok, _pokemon} = Pokemons.delete_pokemon(pokemon)

    conn
    |> put_flash(:info, "Pokemon deleted successfully.")
    |> redirect(to: Routes.pokemon_path(conn, :index))
  end
end
