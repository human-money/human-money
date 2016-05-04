defmodule HumanMoney.TransactionQuery do
  import Ecto.Query

  def by_public_key(public_key) do
    query = from transactions in HumanMoney.Transaction,
            where: transactions.to_public_key == ^public_key or transactions.from_public_key == ^public_key,
            select: transactions
    HumanMoney.Repo.all query
  end
end
