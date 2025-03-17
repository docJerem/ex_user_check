defmodule ExUserCheck.Test.Helpers.StubHelper do
  @moduledoc "Test helpers for mocking HTTP responses in Req"

  def response(status_code, body) do
    Req.Test.stub(ExUserCheck, fn conn ->
      conn
      |> Req.Test.json(body)
      |> Map.put(:status, status_code)
    end)
  end
end
