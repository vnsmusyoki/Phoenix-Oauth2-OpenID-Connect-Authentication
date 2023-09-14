defmodule AccountloginsWeb.AuthController do
  use AccountloginsWeb, :controller
  alias Accountlogins.Accounts.User
  alias Accountlogins.Users
  plug(Ueberauth)


  @doc """
  checking the connection if it is successfull
  """

  # def callback(conn, params) do
  #   IO.inspect(conn)
  #   IO.inspect(params)
  # end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_data = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    # IO.inspect(label: 'this is the data #{user_data}');

    case Users.findOrCreateUser(user_data) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome to OAuth Authentication!")
        |> put_session(:user_id, user.id)
        |> redirect(to: "/dev/dashboard")

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Something went wrong")
        |> redirect(to: "/")
    end
  end
end
