defmodule DApp.Repo.Migrations.CreateSemesters do
  use Ecto.Migration

  def change do
    create table(:semesters, primary_key: false) do
      add :id, :string, primary_key: true

      add :program_id, references(:programs, on_delete: :delete_all, type: :varchar)
      timestamps()
    end

    create index(:semesters, [:program_id, :id])
  end
end
