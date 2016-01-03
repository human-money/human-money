defmodule HelloPhoenix.AccountBalanceQuery do
  import Ecto.Query

  def balance(account_id) do
    debitsQuery = from t in HelloPhoenix.Transaction, where: t.from_public_key == ^account_id, select: sum(t.amount)
    totalDebits = List.first(HelloPhoenix.Repo.all(debitsQuery))

    creditsQuery = from t in HelloPhoenix.Transaction, where: t.to_public_key == ^account_id, select: sum(t.amount)
    totalCredits = List.first(HelloPhoenix.Repo.all(creditsQuery))


    if is_nil(totalDebits) do
      totalDebits = 0
    end

    if is_nil(totalCredits) do
      totalCredits = 0
    end

    totalCredits - totalDebits
  end
end
