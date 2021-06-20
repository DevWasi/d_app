defmodule DApp.Repo.Migrations.CreateTeacherCourses do
  use Ecto.Migration

  def change do
    create table(:teacher_courses) do

      add :course_id, references(:courses, type: :varchar)
      add :user_id, references(:users)


      timestamps()
    end

    create index(:teacher_courses, [:user_id, :course_id])
  end
end
