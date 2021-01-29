defmodule DAppWeb.HomeLive.Index do
  use DAppWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    {:ok, socket}
  end
end