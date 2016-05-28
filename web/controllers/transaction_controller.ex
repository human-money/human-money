defmodule HumanMoney.TransactionController do
  use HumanMoney.Web, :controller
  alias HumanMoney.Transaction

  def create(conn, _params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    params = Map.from_struct(Protobufs.Transaction.decode(data))
    changeset = Transaction.changeset(%Transaction{}, params)
    if changeset.valid? do
      t = HumanMoney.Repo.insert! changeset
      HumanMoney.Endpoint.broadcast! "transactions:*", "new:transaction", %{transaction: HumanMoney.TransactionView.render("transaction.json", transaction: t)}
      conn
        |> send_resp(201, "")
    else
      conn
        |> put_status(:unprocessable_entity)
        |> render(HumanMoney.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def index(conn, _params) do
    query = from t in Transaction,
      order_by: [desc: t.inserted_at]

    if Map.has_key?(_params, "public_key") do
      render conn, "index.json", data: HumanMoney.TransactionQuery.by_public_key(_params["public_key"])
    else
      render conn, "index.json", data: Repo.all(query)
    end
  end
end
