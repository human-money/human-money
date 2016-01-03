defmodule HelloPhoenix.AccountController do
  use HelloPhoenix.Web, :controller

  def show(conn, _params) do
    balance = HelloPhoenix.AccountBalanceQuery.balance(_params["account_id"])
    a = Protobufs.Account.encode(Protobufs.Account.new(balance: balance))
    conn
    |> put_resp_content_type("application/x-protobuf")
    |> send_resp(200, a)
  end
end
