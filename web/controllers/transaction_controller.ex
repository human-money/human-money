defmodule HelloPhoenix.TransactionController do
  use HelloPhoenix.Web, :controller

  def create(conn, _params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    t=Protobufs.Transaction.decode(data)
    conn
      |> send_resp(201, "#{inspect t}")
  end
end
