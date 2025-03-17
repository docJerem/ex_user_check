defmodule ExUserCheck.MixProject do
  use Mix.Project

  @source_url "https://github.com/docJerem/ex_user_check"
  @version "0.2.0"

  def project do
    [
      app: :ex_user_check,
      deps: deps(),
      description: description(),
      elixir: "~> 1.16",
      package: package(),
      source_url: @source_url,
      start_permanent: Mix.env() == :prod,
      version: @version
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7"},
      {:doctor, "~> 0.21.0", only: :dev},
      {:exconstructor, "~> 1.2"},
      {:excoveralls, "~> 0.18.1"},
      {:ex_doc, "~> 0.33.0", only: :dev, runtime: false},
      {:mix_audit, "~> 2.1", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.2", only: [:test]},
      {:mox, "~> 1.0", only: :test},
      {:plug, "~> 1.17"},
      {:req, "~> 0.5.8"}
      # {:sobelow, "~> 0.13.0"}
    ]
  end

  defp description do
    """
    UserCheck's public REST API help your to stop Disposable Emails from Creating Spam Accounts

    Integrate an always up-to-date API to instantly detect temporary and disposable email addresses during user registration.
    """
  end

  defp package do
    [
      maintainers: [
        "Jeremie Flandrin"
      ],
      licenses: ["MIT"],
      links: %{
        "Website" => "https://www.usercheck.com",
        "Github" => @source_url
      }
    ]
  end
end
