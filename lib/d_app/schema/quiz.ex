defmodule DApp.Schema.Quiz do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quizes" do

    belongs_to(:user, DApp.Schema.User)

    timestamps()
  end

  @doc false
  def changeset(quiz, attrs) do
    quiz
    |> cast(attrs, [])
    |> validate_required([])
  end
end
