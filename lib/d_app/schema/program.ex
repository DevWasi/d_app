defmodule DApp.Schema.Program do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "programs" do
    field :name, :string
    field :duration, :string

    timestamps()
  end

  @doc "Program Default   ChangeSet"
  def changeset(program, attrs) do
    program
    |> cast(attrs, [:name, :duration])
    |> validate_required([:name, :duration])
    |> unique_constraint(:name)
  end
end
