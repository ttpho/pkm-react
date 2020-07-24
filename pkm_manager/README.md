# PkmManager

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

## Gen

➜ pkm_manager git:(master) mix phx.gen.html Pokemons Pokemon pokemons name:string national_number:string urls:string gen:string

- creating lib/pkm_manager_web/controllers/pokemon_controller.ex
- creating lib/pkm_manager_web/templates/pokemon/edit.html.eex
- creating lib/pkm_manager_web/templates/pokemon/form.html.eex
- creating lib/pkm_manager_web/templates/pokemon/index.html.eex
- creating lib/pkm_manager_web/templates/pokemon/new.html.eex
- creating lib/pkm_manager_web/templates/pokemon/show.html.eex
- creating lib/pkm_manager_web/views/pokemon_view.ex
- creating test/pkm_manager_web/controllers/pokemon_controller_test.exs
- creating lib/pkm_manager/pokemons/pokemon.ex
- creating priv/repo/migrations/20200724055017_create_pokemons.exs
- creating lib/pkm_manager/pokemons.ex
- injecting lib/pkm_manager/pokemons.ex
- creating test/pkm_manager/pokemons_test.exs
- injecting test/pkm_manager/pokemons_test.exs
