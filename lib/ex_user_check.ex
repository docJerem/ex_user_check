defmodule ExUserCheck do
  @moduledoc """
  Main module for `ExUserCheck`, providing the base API URL and handling API key retrieval.

  This module is responsible for:
  - Defining the root API URL for `usercheck.com`
  - Retrieving the API key from the application's configuration
  - Raising an error if the API key is missing

  ## Configuration

  To use `ExUserCheck`, you must set your `UserCheck` API key in your application's configuration:

  ```elixir

  # config/prod.exs or config/runtime.exs
  config :ex_user_check, :api_key, "your_api_key"

  ```
  """

  @root_api "https://api.usercheck.com"

  @doc """
  Returns the root API URL for usercheck.com.

  ## Examples

      iex> ExUserCheck.root()
      "https://api.usercheck.com"

  """
  def root, do: @root_api

  @spec api_key() :: String.t()
  @doc " Retrieves the API key from the application configuration"
  def api_key do
    Application.get_env(:ex_user_check, :api_key) ||
      raise """
      Missing API key

      Please add usercheck.com API key :

      # config/prod.secret.exs or dev.secret.exs
      config :ex_user_check, :api_key, "my_api_key"
      """
  end
end
