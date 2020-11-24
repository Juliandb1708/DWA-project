defmodule Fit.Repo do
  use Ecto.Repo,
    otp_app: :fit,
    adapter: Ecto.Adapters.Postgres
end
