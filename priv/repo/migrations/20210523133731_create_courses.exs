defmodule DApp.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string
      add :credit_hours, :integer

      add :semester_id, references(:semesters, on_delete: :delete_all)
      timestamps()
    end
    create index(:courses, [:semester_id])
  end
end
