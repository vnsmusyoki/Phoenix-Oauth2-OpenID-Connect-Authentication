defmodule Accountlogins.Repo do
  use Ecto.Repo,
    otp_app: :accountlogins,
    adapter: Ecto.Adapters.Postgres
end
