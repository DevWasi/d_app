defmodule DApp.Schema.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :question, :string
    field :options, :map

    timestamps()
  end

  @doc false
  def changeset(questions, attrs) do
    questions
    |> cast(attrs, [:question, :options])
    |> validate_required([:question, :options])
  end
end
