defmodule SustentaMais.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: true) do
      add(:name, :string)
      add(:email, :string)
      add(:password_hash, :string)
      add(:role, :string)

      timestamps()
    end
  end
end
