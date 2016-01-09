defmodule HelloPhoenix.TransactionQuery do
  import Ecto.Query

  def by_public_key(public_key) do
    query = from transactions in HelloPhoenix.Transaction,
            where: transactions.to_public_key == ^public_key or transactions.from_public_key == ^public_key,
            select: transactions
    HelloPhoenix.Repo.all query
  end
end
