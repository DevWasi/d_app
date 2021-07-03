defmodule DApp.AdminHelper do
  @moduledoc """
  This is the Admin API for the data layer
  """
  alias DApp.Query.Courses, as: Query

  @doc """
  Programs Helper Functions
  """

  def get_program(params), do: Query.get_program(params)
  def get_programs_list(), do: Query.get_programs_list()
  def create_program(params), do: Query.create_program(params)

  def delete_program(%{id: id}) do
    id
    |> Query.get_program()
    |> Query.delete_program()
  end

  def update_program(%{id: id} = params) do
    id
    |> Query.get_program()
    |> Query.update_program(params)
  end

  @doc """
  Semester Helper Functions
  """

  def get_semester(id, program_id), do: Query.get_semester(id, program_id)
  def create_semester(params), do: Query.create_semester(params)

  def delete_semester(%{id: id, program_name: program_id}) do
    id
    |> Query.get_semester(program_id)
    |> Query.delete_semester()
  end

  def update_semester(%{id: id, program_name: program_id}) do
    id
    |> Query.get_semester(program_id)
    |> Query.update_semester(%{id: id, program_id: program_id})
  end

  @doc """
  Courses Helper Functions
  """

  def get_course(params), do: Query.get_course(params)
  def create_course(params), do: Query.create_course(params)

  def delete_course(%{id: id}) do
    id
    |> Query.get_course()
    |> Query.delete_course()
  end

  def update_course(%{id: id, name: name, program_name: program_id}) do
    id
    |> Query.get_course()
    |> Query.update_course(%{name: name, program_id: program_id})
  end
end
