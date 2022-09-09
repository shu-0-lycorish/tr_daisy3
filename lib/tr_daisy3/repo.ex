defmodule TrDaisy3.Repo do
  use Ecto.Repo,
    otp_app: :tr_daisy3,
    adapter: Ecto.Adapters.Postgres
end
