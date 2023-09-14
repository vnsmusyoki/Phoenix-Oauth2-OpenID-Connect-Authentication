defmodule Accountlogins.Users do
  import Ecto.Query, warn: false
  alias Accountlogins.Repo
  alias Accountlogins.Accounts.User

  def findOrCreateUser(user_data) do
    changeset = User.changeset(%User{}, user_data)

    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        IO.puts("User not found, creating a new one")

        case Repo.insert(changeset) do
          {:ok, user} ->
            {:ok, user}

          {:error, _changeset} ->
            {:error, changeset}
        end

      user ->
        {:ok, user}
    end
  end
end
