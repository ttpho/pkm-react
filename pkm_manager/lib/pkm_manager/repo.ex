defmodule PkmManager.Repo do
  use Ecto.Repo,
    otp_app: :pkm_manager,
    adapter: Ecto.Adapters.Postgres
end
