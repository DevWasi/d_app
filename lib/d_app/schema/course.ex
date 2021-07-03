defmodule DApp.Schema.Course do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "courses" do
    field :id, :string, primary_key: true
    field :name, :string
    field :credit_hours, :integer

    belongs_to(:semester, DApp.Schema.Semester, type: :string)
    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:id, :name, :semester_id, :credit_hours])
    |> validate_required([:id, :name, :credit_hours, :semester_id])
  end
end
