import Config

config :ex_user_check, :api_key, "rnd_test"

config :ex_user_check,
  ex_user_check_req_options: [
    plug: {Req.Test, ExUserCheck}
  ]

config :mix_test_watch,
  tasks: [
    "test",
    "format"
  ]
