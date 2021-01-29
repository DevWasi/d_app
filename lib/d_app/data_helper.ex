defmodule DApp.DataHelper do
  @moduledoc """
  This is the Users API for the data layer
  """
  alias DApp.Query.Questions, as: Query
  alias DApp.Schema.Question, as: Schema


  def get_questions(), do: Query.list_questions()

  def get_changeset(),
      do: Schema.changeset(%Schema{})

  def delete(%{"id" => id} = params) do
    Query.delete_questions(params)
  end
end
