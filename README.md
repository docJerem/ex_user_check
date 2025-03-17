# ExUserCheck

🚀 **Elixir client for the UserCheck API** – Validate emails and domains effortlessly.

## Features
- 🔍 **Domain Validation**: Check if a domain is disposable, has MX records, or is flagged as spam.
- ✉️ **Email Validation**: Validate emails, check their risk level, and detect disposable addresses.
- ⚡ **Built with Req**: Simple and efficient HTTP requests.
- 🏗 **Typed Structs**: Automatic deserialization with `ExConstructor`.

---

## Installation

Add `ex_user_check` to your `mix.exs` dependencies:

```elixir
def deps do
  [
    {:ex_user_check, "~> 0.1.0"}
  ]
end
