defmodule HumanMoney.TransactionView do
  use HumanMoney.Web, :view
  @attributes ~W(id)

  def render("index.json", %{data: data}) do
    %{transactions: render_many(data, HumanMoney.TransactionView, "transaction.json")}
  end

  def render("transaction.json", %{transaction: transaction}) do
    transaction
    |> Map.take([
      :uuid,
      :amount,
      :source,
      :destination,
      :inserted_at
    ])
  end
end
