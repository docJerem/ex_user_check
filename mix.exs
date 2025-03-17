defmodule ExUserCheck.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_user_check,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
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
end
