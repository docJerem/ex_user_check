defmodule ExUserCheck.HttpHelpers do
  @moduledoc "Collection of helpers for HTTP requests"
  alias ExUserCheck.Error

  @doc "HTTP get with derserializaiton and error management"
  def get(path, subpath, deserializer_fn, params \\ []) do
    options = req_options(path, subpath, params)

    case Req.get(options) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        {:ok, deserializer_fn.(body)}

      {_, error} ->
        {:error, Error.new(error)}
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
