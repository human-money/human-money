defmodule HumanMoney.Services.AccountCreator do
  alias HumanMoney.Repo
  alias HumanMoney.Account

  def find_or_create(address) do
    account = Account |> Repo.get_by(address: address)
    unless account do
      {:ok, account} = %Account{address: address} |> Repo.insert
    end
    account
  end
end
