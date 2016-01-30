defmodule MasonMoney.TransactionQuery do
  import Ecto.Query

  def by_public_key(public_key) do
    query = from transactions in MasonMoney.Transaction,
            where: transactions.to_public_key == ^public_key or transactions.from_public_key == ^public_key,
            select: transactions
    MasonMoney.Repo.all query
  end
end
