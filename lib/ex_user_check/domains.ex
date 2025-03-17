defmodule ExUserCheck.Domains do
  @moduledoc "Check if a domain is used for disposable email addresses"
  import ExUserCheck.HttpHelpers
  alias ExUserCheck.Domain

  @domain_path "/domain"

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
  def check(email_domain), do: get(@domain_path, "/#{email_domain}", &Domain.new/1)
end
