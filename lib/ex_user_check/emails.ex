defmodule ExUserCheck.Emails do
  @moduledoc "Check if an email address is valid and assess its risk factors"
  import ExUserCheck.HttpHelpers, only: [req_options: 3]
  alias ExUserCheck.Email

  @path "/email"

  @doc """
  Validates an email address and retrieves risk assessment details.

  ## Parameters
  - `email` (*string*): The email address to validate.

  ## Returns
    - `{:ok, response_body}` if the request is successful.
    - `{:error, reason}` if the request fails.

  ## Examples

      iex> ExUserCheck.Emails.check("user@example.com")
      {:ok, %{"valid" => true, "disposable" => false, "spam" => false, ...}}

  """
  def check(email) do
    case Req.get!(options("/#{email}")) do
      %Req.Response{status: 200, body: body} ->
        Email.new(body)

      error_resp ->
        # TODO: render_error(error_resp)
        error_resp
    end
  end

  defp options(subpath, params \\ []), do: req_options(@path, subpath, params)
end
