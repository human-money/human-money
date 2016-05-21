defmodule HumanMoney.Repo.Migrations.CreatePendingTransactions do
  use Ecto.Migration

  def change do
    create table(:pending_transactions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :state, :integer
      add :source, :binary
      add :destination, :binary
      add :amount, :binary
      add :signature, :binary
      timestamps
    end
  end
end
