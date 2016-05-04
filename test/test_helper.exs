ExUnit.start

Mix.Task.run "ecto.create", ~w(-r HumanMoney.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r HumanMoney.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(HumanMoney.Repo)

