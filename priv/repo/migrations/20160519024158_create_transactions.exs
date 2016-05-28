defmodule HumanMoney.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :source, :binary
      add :destination, :binary
      add :amount, :int
      add :signature, :binary
      timestamps
    end
  end
end
