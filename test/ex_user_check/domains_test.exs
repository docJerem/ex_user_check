defmodule ExUserCheck.DomainsTest do
  use ExUnit.Case, async: true
  import ExUserCheck.Test.Helpers.StubHelper
  alias ExUserCheck.Domains
  alias ExUserCheck.Domain
  alias ExUserCheck.Error

  @moduletag :domains

  @valid_response %{
    "did_you_mean" => nil,
    "disposable" => false,
    "domain" => "example.com",
    "mx" => true,
    "public_domain" => false,
    "relay_domain" => false,
    "spam" => false
  }

  describe "check/1" do
    @describetag :check_domain

    test "returns a domain struct on successful request (200)" do
      Req.Test.stub(ExUserCheck, fn conn ->
        Req.Test.json(conn, @valid_response)
      end)

      assert {:ok,
              %Domain{
                did_you_mean: nil,
                disposable: false,
                domain: "example.com",
                mx: true,
                public_domain: false,
                relay_domain: false,
                spam: false
              }} = Domains.check("example.com")
    end

    test "returns an error struct on invalid domain (400)" do
      response(400, %{"error" => "The domain is invalid."})

      assert {:error, %Error{status: 400, error: "The domain is invalid."}} =
               Domains.check("invaldcom")
    end
  end
end
