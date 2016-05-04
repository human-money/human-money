defmodule HumanMoney.AccountBalanceQuery do
  import Ecto.Query

  def balance(account_id) do
    debitsQuery = from t in HumanMoney.Transaction, where: t.from_public_key == ^account_id, select: sum(t.amount)
    totalDebits = List.first(HumanMoney.Repo.all(debitsQuery))

    creditsQuery = from t in HumanMoney.Transaction, where: t.to_public_key == ^account_id, select: sum(t.amount)
    totalCredits = List.first(HumanMoney.Repo.all(creditsQuery))


    if is_nil(totalDebits) do
      totalDebits = 0
    end

    if is_nil(totalCredits) do
      totalCredits = 0
    end

    totalCredits - totalDebits
  end
end
