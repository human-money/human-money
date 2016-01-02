defmodule HelloPhoenix.TransactionController do
  use HelloPhoenix.Web, :controller

  def create(conn, _params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    params=Protobufs.Transaction.decode(data)
    transaction = %HelloPhoenix.Transaction{}
    transaction = Map.merge(transaction, params)
    conn
      |> send_resp(201, "#{inspect transaction}")
    HelloPhoenix.repo.insert transaction
  end
end
