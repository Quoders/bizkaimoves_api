defmodule BizkaimovesApi.Repo do
  use Ecto.Repo,
    otp_app: :bizkaimoves_api,
    adapter: Ecto.Adapters.Postgres
end
