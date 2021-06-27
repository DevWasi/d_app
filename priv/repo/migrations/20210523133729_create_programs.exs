defmodule DApp.Repo.Migrations.CreatePrograms do
  use Ecto.Migration

  def change do
    create table(:programs) do
      add :name, :string
      add :duration, :string

      timestamps()
    end

    create unique_index(:programs, [:name])
  end
end
