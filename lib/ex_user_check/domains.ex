defmodule ExUserCheck.Domains do
  @moduledoc "Check if a domain is used for disposable email addresses"
  import ExUserCheck.HttpHelpers, only: [req_options: 3]
  #         # TODO:  import ErrorFallback
  alias ExUserCheck.Domain

  @path "/domain"

  @doc """
  Returns information about whether a domain is used for disposable email addresses,
  including MX record presence, public email service status, and more.

  ## Parameters
  - `domain` (*string*): The domain name to query.

  ## Returns
    - `{:ok, response_body}` if the request is successful.
    - `{:error, reason}` if the request fails.

  ## Examples

      iex> ExUserCheck.Domains.retrieve("example.com")
      {:ok, %{"status" => "active", "details" => %{...}}}

  """
  def check(email_domain) do
    case Req.get!(options("/#{email_domain}")) do
      %Req.Response{status: 200, body: body} ->
        Domain.new(body)

      error_resp ->
        # TODO: render_error(error_resp)
        error_resp
    end
  end

  defp options(subpath, params \\ []), do: req_options(@path, subpath, params)
end
