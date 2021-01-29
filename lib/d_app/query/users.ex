defmodule DApp.Query.Users do
  @moduledoc """
  The User context.
  """

  import Ecto.Query, warn: false

  alias DApp.Repo
  alias DApp.Schema.User
  alias DApp.Schema.Quiz

  @doc """
  Returns the list of user.
  """
  def list_user do
    Repo.all(User)
  end

  @doc """
  Gets a single user by id
  """
  def get_user(id), do: Repo.get!(User, id)


  @doc """
  Gets a single user by username
  """
  def get_user_by_username(username) do
    query = from(u in User, where: u.username == ^username, preload: [:quizes])
    case Repo.one(query) do
      nil ->
        {:error, :user_does_not_exist}
      user ->
        {:ok, user}
    end
end

  @doc """
  Creates a user.
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end