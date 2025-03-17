defmodule ExUserCheck do
  @root_api "https://api.usercheck.com"

  def root, do: @root_api

  @spec api_key() :: String.t()
  @doc "Return the API key from config.exs"
  def api_key do
    Application.get_env(:ex_user_check, :api_key) |> IO.inspect(label: "ex_user_check")

    Application.get_env(:ex_user_check, :api_key) ||
      raise """
      Missing API key

      Please add usercheck.com API key :

      # config/prod.secret.exs or dev.secret.exs
      config :ex_user_check, :api_key, "my_api_key"
      """
  end
end
