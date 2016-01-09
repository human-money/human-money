defmodule HelloPhoenix.AccountController do
  use HelloPhoenix.Web, :controller

  def show(conn, _params) do
    balance = HelloPhoenix.AccountBalanceQuery.balance(_params["account_id"])
    data = %{balance: balance}
    render conn, "show.json", data: data
  end
end
