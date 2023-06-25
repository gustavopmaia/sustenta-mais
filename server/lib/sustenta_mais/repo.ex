defmodule SustentaMais.Repo do
  use Ecto.Repo,
    otp_app: :sustenta_mais,
    adapter: Ecto.Adapters.Postgres
end
