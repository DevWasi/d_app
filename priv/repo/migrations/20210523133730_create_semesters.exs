defmodule DApp.Repo.Migrations.CreateSemesters do
  use Ecto.Migration

  def change do
    create table(:semesters) do
      add :semester, :string

      add :program_id, references(:programs, type: :varchar, on_delete: :delete_all)
      timestamps()
    end

    create index(:semesters, [:program_id])
  end
end
