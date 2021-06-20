defmodule DApp.Schema.Course do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "courses" do
    field :id, :string, primary_key: true
    field :name, :string

    belongs_to(:semester, DApp.Schema.Semester)
    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:id, :name, :semester_id])
    |> validate_required([:id, :name])
  end
end
