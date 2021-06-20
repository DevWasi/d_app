defmodule DApp.Repo.Migrations.CreateUserRoles do
  use Ecto.Migration

  def change do
    create table(:user_roles, primary_key: false) do
      add :id, :string, primary_key: true

      timestamps()
    end

  end
end
