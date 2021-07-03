defmodule DApp.Schema.Semester do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "semesters" do
    field :id, :string, primary_key: true

    belongs_to(:program, DApp.Schema.Program, type: :string)
    timestamps()
  end

  @doc """
  This Is default changeset for semesters.
  """
  def changeset(semester, attrs) do
    semester
    |> cast(attrs, [:program_id, :id])
    |> validate_required([:program_id, :id])
  end
end
