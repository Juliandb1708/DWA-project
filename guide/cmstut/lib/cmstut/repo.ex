defmodule Cmstut.Repo do
  use Ecto.Repo,
    otp_app: :cmstut,
    adapter: Ecto.Adapters.Postgres
end
