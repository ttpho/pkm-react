defmodule PkmManager.PokemonsTest do
  use PkmManager.DataCase

  alias PkmManager.Pokemons

  describe "pokemons" do
    alias PkmManager.Pokemons.Pokemon

    @valid_attrs %{
      gen: "some gen",
      name: "some name",
      national_number: "some national_number",
      urls: "some urls"
    }
    @update_attrs %{
      gen: "some updated gen",
      name: "some updated name",
      national_number: "some updated national_number",
      urls: "some updated urls"
    }
    @invalid_attrs %{gen: nil, name: nil, national_number: nil, urls: nil}

    def pokemon_fixture(attrs \\ %{}) do
      {:ok, pokemon} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pokemons.create_pokemon()

      pokemon
    end

    test "list_pokemons/0 returns all pokemons" do
      pokemon = pokemon_fixture()
      assert Pokemons.list_pokemons() == [pokemon]
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      assert Pokemons.get_pokemon!(pokemon.id) == pokemon
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      assert {:ok, %Pokemon{} = pokemon} = Pokemons.create_pokemon(@valid_attrs)
      assert pokemon.gen == "some gen"
      assert pokemon.name == "some name"
      assert pokemon.national_number == "some national_number"
      assert pokemon.urls == "some urls"
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pokemons.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{} = pokemon} = Pokemons.update_pokemon(pokemon, @update_attrs)
      assert pokemon.gen == "some updated gen"
      assert pokemon.name == "some updated name"
      assert pokemon.national_number == "some updated national_number"
      assert pokemon.urls == "some updated urls"
    end

    test "update_pokemon/2 with invalid data returns error changeset" do
      pokemon = pokemon_fixture()
      assert {:error, %Ecto.Changeset{}} = Pokemons.update_pokemon(pokemon, @invalid_attrs)
      assert pokemon == Pokemons.get_pokemon!(pokemon.id)
    end

    test "delete_pokemon/1 deletes the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{}} = Pokemons.delete_pokemon(pokemon)
      assert_raise Ecto.NoResultsError, fn -> Pokemons.get_pokemon!(pokemon.id) end
    end

    test "change_pokemon/1 returns a pokemon changeset" do
      pokemon = pokemon_fixture()
      assert %Ecto.Changeset{} = Pokemons.change_pokemon(pokemon)
    end
  end

  describe "pokemons" do
    alias PkmManager.Pokemons.Pokemon

    @valid_attrs %{
      gen: "some gen",
      name: "some name",
      national_number: "some national_number",
      url_image: "some url_image",
      url_link: "some url_link"
    }
    @update_attrs %{
      gen: "some updated gen",
      name: "some updated name",
      national_number: "some updated national_number",
      url_image: "some updated url_image",
      url_link: "some updated url_link"
    }
    @invalid_attrs %{gen: nil, name: nil, national_number: nil, url_image: nil, url_link: nil}

    def pokemon_fixture(attrs \\ %{}) do
      {:ok, pokemon} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pokemons.create_pokemon()

      pokemon
    end

    test "list_pokemons/0 returns all pokemons" do
      pokemon = pokemon_fixture()
      assert Pokemons.list_pokemons() == [pokemon]
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      assert Pokemons.get_pokemon!(pokemon.id) == pokemon
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      assert {:ok, %Pokemon{} = pokemon} = Pokemons.create_pokemon(@valid_attrs)
      assert pokemon.gen == "some gen"
      assert pokemon.name == "some name"
      assert pokemon.national_number == "some national_number"
      assert pokemon.url_image == "some url_image"
      assert pokemon.url_link == "some url_link"
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pokemons.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{} = pokemon} = Pokemons.update_pokemon(pokemon, @update_attrs)
      assert pokemon.gen == "some updated gen"
      assert pokemon.name == "some updated name"
      assert pokemon.national_number == "some updated national_number"
      assert pokemon.url_image == "some updated url_image"
      assert pokemon.url_link == "some updated url_link"
    end

    test "update_pokemon/2 with invalid data returns error changeset" do
      pokemon = pokemon_fixture()
      assert {:error, %Ecto.Changeset{}} = Pokemons.update_pokemon(pokemon, @invalid_attrs)
      assert pokemon == Pokemons.get_pokemon!(pokemon.id)
    end

    test "delete_pokemon/1 deletes the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{}} = Pokemons.delete_pokemon(pokemon)
      assert_raise Ecto.NoResultsError, fn -> Pokemons.get_pokemon!(pokemon.id) end
    end

    test "change_pokemon/1 returns a pokemon changeset" do
      pokemon = pokemon_fixture()
      assert %Ecto.Changeset{} = Pokemons.change_pokemon(pokemon)
    end
  end
end
