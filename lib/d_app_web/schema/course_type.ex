defmodule DAppWeb.Schema.CourseType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: DApp.Repo

  #---------------------Courses Object------------------------
  object :course_type do
    field :id, :string
    field :name, :string

    field(:program, :program_type, resolve: assoc(:programs))
    field(:semester, :semester_type, resolve: assoc(:semesters))
  end

  #---------------------These Are Courses Input Types------------------------
  input_object :create_course_input_type do
    field :name, :string
    field :program_name, :string
  end
  input_object :update_course_input_type do
    field :id, :integer
    field :name, :string
    field :program_name, :string
  end
  input_object :delete_course_input_type do
    field :id, :integer
  end
end