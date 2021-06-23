defmodule DApp.Schema.Semester do
  use Ecto.Schema
  import Ecto.Changeset

  schema "semesters" do
    field :semester, :string

    belongs_to(:program, DApp.Schema.Program, foreign_key: :program_id)
    timestamps()
  end

  @doc """
  This Is default changeset for semesters.
  """
  def changeset(semester, attrs) do
    semester
    |> cast(attrs, [:program_id, :semester])
    |> validate_required([:program_id, :semester])
  end
end
