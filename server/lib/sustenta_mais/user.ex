defmodule SustentaMais.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key(:id, Ecto.UUID, autogenerate: true)
end
