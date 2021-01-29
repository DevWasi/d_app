defmodule DApp.Query.Questions do
  @moduledoc """
  The Questions context.
  """

  import Ecto.Query, warn: false

  alias DApp.Repo
  alias DApp.Schema.Question

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single questions.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_questions!(123)
      %Question{}

      iex> get_questions!(456)
      ** (Ecto.NoResultsError)

  """
  def get_questions!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a questions.

  ## Examples

      iex> create_questions(%{field: value})
      {:ok, %Question{}}

      iex> create_questions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_questions(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a questions.

  ## Examples

      iex> update_questions(questions, %{field: new_value})
      {:ok, %Question{}}

      iex> update_questions(questions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_questions(%Question{} = questions, attrs) do
    questions
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a questions.

  ## Examples

      iex> delete_questions(questions)
      {:ok, %Question{}}

      iex> delete_questions(questions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_questions(%Question{} = questions) do
    Repo.delete(questions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking questions changes.

  ## Examples

      iex> change_questions(questions)
      %Ecto.Changeset{data: %Question{}}

  """
  def change_questions(%Question{} = questions, attrs \\ %{}) do
    Question.changeset(questions, attrs)
  end
end
