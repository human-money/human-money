defmodule HumanMoney.AccountController do
  use HumanMoney.Web, :controller

  def show(conn, _params) do
    balance = HumanMoney.AccountBalanceQuery.balance(_params["account_id"])
    data = %{balance: balance}
    render conn, "show.json", data: data
  end
end
