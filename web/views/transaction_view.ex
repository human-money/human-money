defmodule HumanMoney.TransactionView do
  use HumanMoney.Web, :view
  @attributes ~W(id)

  def render_detail(message) do
    message
  end

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
      :inserted_at,
      :updated_at
    ])
    |> base64_encode_bitstrings
  end

  def base64_encode_bitstrings(transaction) do
    for {k, v} <- transaction, into: %{} do
      if is_bitstring(v) do
        {k, Base.encode64(v)}
      else
        {k, v}
      end
    end
  end
end
