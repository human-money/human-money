defmodule HumanMoney.Repo.Migrations.CreateTransaction do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :amount, :integer
      add :source_id, references(:accounts, on_delete: :nothing)
      add :destination_id, references(:accounts, on_delete: :nothing)

      timestamps
    end
    create index(:transactions, [:source_id])
    create index(:transactions, [:destination_id])

  end
end
