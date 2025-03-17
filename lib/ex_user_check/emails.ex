defmodule ExUserCheck.Emails do
  @moduledoc "Check if an email address is valid and assess its risk factors"
  import ExUserCheck.HttpHelpers
  alias ExUserCheck.Email

  @email_path "/email"

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
  def check(email), do: get(@email_path, "/#{email}", &Email.new/1)
end
