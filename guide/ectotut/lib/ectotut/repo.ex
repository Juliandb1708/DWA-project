defmodule Ectotut.Repo do
  use Ecto.Repo,
    otp_app: :ectotut,
    adapter: Ecto.Adapters.Postgres
end
