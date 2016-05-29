defmodule HumanMoney.Queries.Account do
  alias HumanMoney.Repo
  alias HumanMoney.Account
  alias HumanMoney.Transaction
  import Ecto.Query

  def balance(id) do
    credits(id) - debits(id)
  end

  def credits(id) do
    sum_amount(from t in Transaction, where: t.destination_id == ^id)
  end

  def debits(id) do
    sum_amount(from t in Transaction, where: t.source_id == ^id)
  end

  def sum_amount(query) do
    (from t in query,
      select: sum(t.amount))
      |> Repo.one
      |> (&(if &1, do: &1, else: 0)).()
  end
end
