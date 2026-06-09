import Config

config :mix_test_watch,
  tasks: [
    "test",
    "format"
  ]

if File.exists?(Path.expand("dev.secret.exs", __DIR__)) do
  import_config "dev.secret.exs"
end
