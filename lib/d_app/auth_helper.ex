defmodule DApp.AuthHelper do
  @moduledoc """
  This is the Users API for the data layer
  """
  alias DApp.Query.Users, as: Query
  alias DApp.Schema.User, as: Schema

  def create_user(params), do: Query.create_user(params)

  def get_user(params), do: Query.get_user_by_username(params)

  def get_changeset(),
      do: Schema.changeset(%Schema{})

  def delete(%{"id" => id} = params) do
    Query.delete_user(params)
  end
end
