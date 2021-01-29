defmodule DApp.Repo.Migrations.CreateQuizes do
  use Ecto.Migration

  def change do
    create table(:quizes) do
      add :user_id, references(:users)

      timestamps()
    end

  end
end
