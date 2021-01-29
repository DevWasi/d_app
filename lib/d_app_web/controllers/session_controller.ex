defmodule DAppWeb.SessionController do
  use DAppWeb, :controller

  alias DApp.Auth.Guardian
  alias DApp.AuthHelper, as: Data

  def login(conn, params) do
    case authenticate(params["user"]) do

      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: "/home")

      {:error, reason} ->
        redirect(conn, to: "/login")
    end
  end

  def signup(conn, %{"user" => user} = params) do
    case Data.get_user(user["username"]) do

      {:ok, user} ->
        conn
        |> redirect(to: "/signup")

      {:error, :user_does_not_exist} ->
        Data.create_user(user)
        conn
        |> redirect(to: "/home")
    end
  end

  def logout(conn),
      do: Guardian.Plug.sign_out(conn)

  defp authenticate(%{"username" => username, "password" => password} = params) do
    case Data.get_user(username) do

      {:error, :user_does_not_exist} ->
        {:error, "User Doesn't Exist"}

      {:ok, user} ->
        if(Argon2.verify_pass(password, user.password)) do
          {:ok, user}
        else
          {:error, "Invalid Password"}
        end
    end
  end
end