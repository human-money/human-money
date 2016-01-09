defmodule HelloPhoenix.TransactionController do
  use HelloPhoenix.Web, :controller

  def create(conn, _params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    params = Map.from_struct(Protobufs.Transaction.decode(data))
    transaction = %HelloPhoenix.Transaction{}
    transaction = Map.merge(transaction, params)
    HelloPhoenix.Repo.insert transaction

    conn
      |> send_resp(201, "")
  end

  def index(conn, _params) do
    if Map.has_key?(_params, "public_key") do
      render conn, "index.json", data: HelloPhoenix.TransactionQuery.by_public_key(_params["public_key"])
    else
      render conn, "index.json", data: Repo.all(HelloPhoenix.Transaction)
    end
  end
end
