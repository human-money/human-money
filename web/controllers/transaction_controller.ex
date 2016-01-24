defmodule HelloPhoenix.TransactionController do
  use HelloPhoenix.Web, :controller
  alias HelloPhoenix.Transaction

  def create(conn, params) do
    #{:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    changeset = Transaction.changeset(%Transaction{}, params)
    if changeset.valid? do
      t = HelloPhoenix.Repo.insert! changeset
      HelloPhoenix.Endpoint.broadcast! "transactions:*", "new:transaction", %{transaction: HelloPhoenix.TransactionView.render("transaction.json", transaction: t)}
      conn
        |> send_resp(201, "")
    else
      conn
        |> put_status(:unprocessable_entity)
        |> render(HelloPhoenix.ChangesetView, "error.json", changeset)
    end
  end

  def index(conn, _params) do
    query = from t in Transaction,
      order_by: [desc: t.inserted_at]

    if Map.has_key?(_params, "public_key") do
      render conn, "index.json", data: HelloPhoenix.TransactionQuery.by_public_key(_params["public_key"])
    else
      render conn, "index.json", data: Repo.all(query)
    end
  end
end
