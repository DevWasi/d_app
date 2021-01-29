defmodule DApp.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :string
      add :options, :jsonb

      timestamps()
    end

  end
end
