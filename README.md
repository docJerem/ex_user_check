# ExUserCheck

**ExUserCheck** is an Elixir client for the [UserCheck API](https://usercheck.com), enabling developers to verify and assess the validity and risk factors of email addresses and domains.

## Features

- 🔍 **Email Validation**: Determine if an email address is valid and assess associated risk factors.
- 🌍 **Domain Verification**: Check if a domain is associated with disposable email providers, has valid MX records, and more.
- ⚡ **Built with Req**: Simple and efficient HTTP requests.
- 🏗 **Typed Structs**: Automatic deserialization with `ExConstructor`.

## Installation

Add `ex_user_check` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_user_check, "~> 0.2.1"}
  ]
end
```

## Configuration

Set up your **UserCheck API key** in your application's configuration.  
It's recommended to store sensitive information like API keys in **environment variables** or secret configuration files.

### Example: `config/runtime.exs`

```elixir
import Config

config :ex_user_check, api_key: System.fetch_env!("USERCHECK_API_KEY")
```

## Usage

### 📧 Email Validation

To validate an email address and retrieve risk assessment details:

```elixir
iex> ExUserCheck.Emails.check("user@example.com")
{:ok, %ExUserCheck.Email{valid: true, disposable: false, spam: false, ...}}
```

### 🌐 Domain Verification

To check if a domain is associated with disposable email providers and assess its validity:

```elixir
iex> ExUserCheck.Domains.check("example.com")
{:ok, %ExUserCheck.Domain{disposable: false, mx: true, public_domain: false, ...}}
```

## Documentation

📖 Full documentation is available at **[HexDocs](https://hexdocs.pm/ex_user_check)**.

## Contributing

We welcome contributions! 🎉 To contribute:

1. Fork the repository.
2. Create a feature branch:  
   ```sh
   git checkout -b feature-branch
   ```
3. Make your changes.
4. Run tests to ensure everything is working:  
   ```sh
   mix test
   ```
5. Commit and push:  
   ```sh
   git commit -m "Added new feature"
   git push origin feature-branch
   ```
6. Open a pull request on GitHub. 🚀

## License

📝 This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
