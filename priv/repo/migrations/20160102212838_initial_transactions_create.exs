defmodule HelloPhoenix.Repo.Migrations.InitialTransactionsCreate do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :to_address, :string
      add :to_public_key, :string
      add :from_address, :string
      add :from_public_key, :string
      add :amount, :integer
      add :signature, :string

      timestamps
    end
  end
end
