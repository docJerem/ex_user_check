defmodule ExUserCheck.EmailsTest do
  use ExUnit.Case, async: true
  import ExUserCheck.Test.Helpers.StubHelper
  alias ExUserCheck.Emails
  alias ExUserCheck.Email
  alias ExUserCheck.Error

  @moduletag :emails

  @valid_response %{
    "alias" => false,
    "blocklisted" => false,
    "email" => "user@example.com",
    "did_you_mean" => nil,
    "disposable" => false,
    "domain" => "example.com",
    "mx" => true,
    "public_domain" => false,
    "relay_domain" => false,
    "role_account" => false,
    "spam" => false
  }

  describe "check/1" do
    @describetag :check_email

    test "returns an email struct on successful request (200)" do
      Req.Test.stub(ExUserCheck, fn conn ->
        Req.Test.json(conn, @valid_response)
      end)

      assert {:ok,
              %Email{
                alias: false,
                blocklisted: false,
                email: "user@example.com",
                did_you_mean: nil,
                disposable: false,
                domain: "example.com",
                mx: true,
                public_domain: false,
                relay_domain: false,
                role_account: false,
                spam: false
              }} = Emails.check("user@example.com")
    end

    test "returns an error struct on invalid email (400)" do
      response(400, %{"error" => "Invalid email format."})

      assert {:error, %Error{status: 400, error: "Invalid email format."}} =
               Emails.check("invalid-email")
    end
  end
end
