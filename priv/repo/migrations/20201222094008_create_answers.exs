defmodule DApp.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :answer, :string

      add :quiz, references(:quizes)
      add :question, references(:questions)

      timestamps()
    end

  end
end
