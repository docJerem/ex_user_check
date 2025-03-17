defmodule ExUserCheck.Error do
  @moduledoc "Deserialization model for ExUserCheck API errors"

  @enforce_keys ~w(
    status
    error
  )a

  defstruct @enforce_keys

  @type t :: %__MODULE__{
          status: integer(),
          error: String.t()
        }

  use ExConstructor
end
