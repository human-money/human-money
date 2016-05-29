defmodule HumanMoney.TransactionController do
  use HumanMoney.Web, :controller
  alias HumanMoney.Transaction
  alias HumanMoney.Services.AccountCreator

  def create(conn, _params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    params = Map.from_struct(Protobufs.Transaction.decode(data))
    source = AccountCreator.find_or_create(params[:source])
    destination = AccountCreator.find_or_create(params[:destination])
    changeset = Transaction.changeset(
      %Transaction{},
      %{
        amount: params[:amount],
        source_id: source.id,
        destination_id: destination.id
      }
    )
      |> Ecto.Changeset.put_change(:source_id, source.id)
      |> Ecto.Changeset.put_change(:destination_id, destination.id)

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
    render conn, data: Repo.all from t in Transaction,
            preload: [:source, :destination]
  end

  def show(conn, params) do
    render conn, data: Repo.get(Article, params[:id])
  end
end
