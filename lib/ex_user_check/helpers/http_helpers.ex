defmodule ExUserCheck.HttpHelpers do
  @moduledoc "Collection of helpers for HTTP requests"
  alias ExUserCheck.Error

  @doc """
  Performs an HTTP GET request with deserialization and error management.

  ## Parameters
    - `path` (*binary*): Base API path.
    - `subpath` (*binary*): API subpath.
    - `deserializer_fn` (*function*): Function to deserialize the response body.
    - `params` (*keyword list*, optional): Query parameters.

  ## Returns
    - `{:ok, deserialized_data}` on success (`200`).
    - `{:error, ExUserCheck.Error.t()}` on failure.
  """
  @spec get(binary(), binary(), (map() -> any()), keyword()) :: {:ok, any()} | {:error, ExUserCheck.Error.t()}
  def get(path, subpath, deserializer_fn, params \\ []) do
    options = req_options(path, subpath, params)

    case Req.get(options) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        {:ok, deserializer_fn.(body)}

      {:ok, %Req.Response{status: status, body: %{"error" => error_msg}}} ->
          {:error, %ExUserCheck.Error{status: status, error: error_msg}}

      {:error, reason} ->
        {:error, Error.new(%{"status" => 500, "error" => inspect(reason)})}
    end
  end

  @spec req_options(binary(), binary(), keyword()) :: keyword()
  @doc "HTTP options of req middleware"
  def req_options(path, subpath, params) do
    Keyword.merge(
      [
        base_url: ExUserCheck.root(),
        url: path <> subpath,
        params: params,
        auth: bearer()
      ],
      Application.get_env(:ex_user_check, :ex_user_check_req_options, [])
    )
  end

  defp bearer, do: {:bearer, ExUserCheck.api_key()}
end
