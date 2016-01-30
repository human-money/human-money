defmodule MasonMoney.TransactionController do
  use MasonMoney.Web, :controller
  alias MasonMoney.Transaction

  def create(conn, params) do
    #{:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    changeset = Transaction.changeset(%Transaction{}, params)
    if changeset.valid? do
      t = MasonMoney.Repo.insert! changeset
      MasonMoney.Endpoint.broadcast! "transactions:*", "new:transaction", %{transaction: MasonMoney.TransactionView.render("transaction.json", transaction: t)}
      conn
        |> send_resp(201, "")
    else
      conn
        |> put_status(:unprocessable_entity)
        |> render(MasonMoney.ChangesetView, "error.json", changeset)
    end
  end

  def index(conn, _params) do
    query = from t in Transaction,
      order_by: [desc: t.inserted_at]

    if Map.has_key?(_params, "public_key") do
      render conn, "index.json", data: MasonMoney.TransactionQuery.by_public_key(_params["public_key"])
    else
      render conn, "index.json", data: Repo.all(query)
    end
  end
end
