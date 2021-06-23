defmodule DApp.Schema.Program do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "programs" do
    field :id, :string, primary_key: true
    field :name, :string
    field :duration, :string

    timestamps()
  end

  @doc "Program Default ChangeSet"
  def changeset(program, attrs) do
    program
    |> cast(attrs, [:name, :duration, :id])
    |> validate_required([:name, :duration])
  end
end
