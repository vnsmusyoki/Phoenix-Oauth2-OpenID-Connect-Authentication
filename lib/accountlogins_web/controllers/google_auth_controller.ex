defmodule AccountloginsWeb.GoogleAuthController do
  use AccountloginsWeb, :controller
  # alias Accountlogins.Accounts.User
  # alias Accountlogins.Users
  plug(Ueberauth)

  @doc """
  checking the connection if it is successfull
  """

  # def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
  #   IO.inspect(conn)
  #   IO.inspect(label: 'this are the results of the query')
  #   IO.inspect(auth)
  # end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do

    IO.inspect(label: 'this are the results of the query')
    IO.inspect(auth)

    # case UserFromAuth.find_or_create(auth) do
    #   {:ok, user} ->
    #     conn
    #     |> put_flash(:info, "Successfully authenticated.")
    #     |> put_session(:current_user, user)
    #     |> configure_session(renew: true)
    #     |> redirect(to: "/")

    #   {:error, reason} ->
    #     conn
    #     |> put_flash(:error, reason)
    #     |> redirect(to: "/")
    # end
  end
end
