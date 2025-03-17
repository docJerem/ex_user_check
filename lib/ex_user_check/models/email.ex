defmodule ExUserCheck.Email do
  @moduledoc "Deserialization model for ExUserCheck email validation results"

  @enforce_keys ~w(
    alias
    blocklisted
    email
    did_you_mean
    disposable
    domain
    mx
    public_domain
    relay_domain
    role_account
    spam
  )a

  defstruct @enforce_keys

  @type t :: %__MODULE__{
          alias: boolean(),
          blocklisted: boolean(),
          did_you_mean: nil | String.t(),
          disposable: boolean(),
          domain: String.t(),
          email: String.t(),
          mx: boolean(),
          public_domain: boolean(),
          relay_domain: boolean(),
          role_account: boolean(),
          spam: boolean()
        }

  use ExConstructor
end
