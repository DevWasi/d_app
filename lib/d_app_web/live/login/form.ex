defmodule DAppWeb.LoginLive.Form do
  use DAppWeb, :live_view

  alias DApp.AuthHelper, as: User

  @impl true
  def mount(_params, session, socket) do
    {
      :ok,
      socket
      |> assign(:changeset, User.get_changeset())
    }
  end
end