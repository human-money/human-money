defmodule HumanMoney.TransactionView do
  use HumanMoney.Web, :view
  use JaSerializer.PhoenixView
  alias HumanMoney.AccountSerializer

  location "/transactions"
  attributes [:inserted_at, :updated_at, :source, :destination]

  def source(transaction, _conn), do: encode(transaction.source)
  def destination(transaction, _conn), do: encode(transaction.destination)


  def encode(account) do
    if account do
      Base.encode64(account.address)
    end
  end
end
