ExUnit.start

Mix.Task.run "ecto.create", ~w(-r MasonMoney.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r MasonMoney.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(MasonMoney.Repo)

