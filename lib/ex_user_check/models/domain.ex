defmodule ExUserCheck.Domain do
  @moduledoc "Deserialization model for ExUserCheck domains"

  @enforce_keys ~w(
    did_you_mean
    disposable
    domain
    mx
    public_domain
    relay_domain
    spam
  )a

  defstruct @enforce_keys

  @type t :: %__MODULE__{
          did_you_mean: nil | String.t(),
          disposable: boolean(),
          domain: String.t(),
          mx: boolean(),
          public_domain: boolean(),
          relay_domain: boolean(),
          spam: boolean()
        }

  use ExConstructor
end
