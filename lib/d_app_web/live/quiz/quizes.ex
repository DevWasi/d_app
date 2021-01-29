defmodule DAppWeb.QuizLive.Quizes do
  use DAppWeb, :live_view

  alias DApp.DataHelper, as: Data

  @impl true
  def mount(_params, session, socket) do

    questions = Data.get_questions()

    IO.inspect("====================================START====================================")
    IO.inspect(questions)
    IO.inspect("====================================END======================================")

    socket = socket
             |> assign(:questions, questions)

    {:ok, socket}
  end
end